package com.truck.controller;

import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.KeyFactory;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.Certificate;
import java.security.cert.CertificateFactory;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Collection;

/**
 * ImportKey.java
 *
 * 
This class imports a key and a certificate into a keystore
 * ($home/keystore.ImportKey). If the keystore is
 * already present, it is simply deleted. Both the key and the
 * certificate file must be in DER-format. The key must be
 * encoded with PKCS#8-format. The certificate must be
 * encoded in X.509-format.


 *
 * 
Key format:


 * 
openssl pkcs8 -topk8 -nocrypt -in YOUR.KEY -out YOUR.KEY.der
 * -outform der


 * 
Format of the certificate:


 * 
openssl x509 -in YOUR.CERT -out YOUR.CERT.der -outform
 * der


 * 
Import key and certificate:


 * 
java comu.ImportKey YOUR.KEY.der YOUR.CERT.der



 *
 * 
Caution: the old keystore.ImportKey-file is
 * deleted and replaced with a keystore only containing YOUR.KEY
 * and YOUR.CERT. The keystore and the key has no password; 
 * they can be set by the keytool -keypasswd-command for setting
 * the key password, and the keytool -storepasswd-command to set
 * the keystore password.
 * 

The key and the certificate is stored under the alias
 * importkey; to change this, use keytool -keyclone.
 *
 * Created: Fri Apr 13 18:15:07 2001
 * Updated: Fri Apr 19 11:03:00 2002
 *
 * @author Joachim Karrer, Jens Carlberg
 * @version 1.1
 **/
public class ImportKey  {
    
    /**
     * 

Creates an InputStream from a file, and fills it with the complete
     * file. Thus, available() on the returned InputStream will return the
     * full number of bytes the file contains


     * @param fname The filename
     * @return The filled InputStream
     * @exception IOException, if the Streams couldn't be created.
     **/
    private static InputStream fullStream ( String fname ) throws IOException {
        FileInputStream fis = new FileInputStream(fname);
        DataInputStream dis = new DataInputStream(fis);
        byte[] bytes = new byte[dis.available()];
        dis.readFully(bytes);
        ByteArrayInputStream bais = new ByteArrayInputStream(bytes);
        return bais;
    }
        
    /**
     * 
Takes two file names for a key and the certificate for the key, 
     * and imports those into a keystore. Optionally it takes an alias
     * for the key.
     * 

The first argument is the filename for the key. The key should be
     * in PKCS8-format.
     * 

The second argument is the filename for the certificate for the key.
     * 

If a third argument is given it is used as the alias. If missing,
     * the key is imported with the alias importkey
     * 

The name of the keystore file can be controlled by setting
     * the keystore property (java -Dkeystore=mykeystore). If no name
     * is given, the file is named keystore.ImportKey
     * and placed in your home directory.
     * @param args [0] Name of the key file, [1] Name of the certificate file
     * [2] Alias for the key.
     **/
    public static void main ( String args[]) {
        
        // change this if you want another password by default
        String keypass = "importkey";
        
        // change this if you want another alias by default
        String defaultalias = "importkey";

        // change this if you want another keystorefile by default
        String keystorename = System.getProperty("keystore");

        if (keystorename == null)
            keystorename = System.getProperty("user.home")+
                System.getProperty("file.separator")+
                "keystore.ImportKey"; // especially this ;-)


        // parsing command line input
        String keyfile = "";
        String certfile = "";
        if (args.length < 2 || args.length>3) {
            System.out.println("Usage: java comu.ImportKey keyfile certfile [alias]");
            System.exit(0);
        } else {
            keyfile = args[0];
            certfile = args[1];
            if (args.length>2)
                defaultalias = args[2];
        }

        try {
            // initializing and clearing keystore 
            KeyStore ks = KeyStore.getInstance("JKS", "SUN");
            ks.load( null , keypass.toCharArray());
            System.out.println("Using keystore-file : "+keystorename);
            ks.store(new FileOutputStream ( keystorename  ),
                    keypass.toCharArray());
            ks.load(new FileInputStream ( keystorename ),
                    keypass.toCharArray());

            // loading Key
            InputStream fl = fullStream (keyfile);
            byte[] key = new byte[fl.available()];
            KeyFactory kf = KeyFactory.getInstance("RSA");
            fl.read ( key, 0, fl.available() );
            fl.close();
            PKCS8EncodedKeySpec keysp = new PKCS8EncodedKeySpec ( key );
            PrivateKey ff = kf.generatePrivate (keysp);

            // loading CertificateChain
            CertificateFactory cf = CertificateFactory.getInstance("X.509");
            InputStream certstream = fullStream (certfile);

            Collection c = cf.generateCertificates(certstream) ;
            Certificate[] certs = new Certificate[c.toArray().length];

            if (c.size() == 1) {
                certstream = fullStream (certfile);
                System.out.println("One certificate, no chain.");
                Certificate cert = cf.generateCertificate(certstream) ;
                certs[0] = cert;
            } else {
                System.out.println("Certificate chain length: "+c.size());
                certs = (Certificate[])c.toArray();
            }

            // storing keystore
            ks.setKeyEntry(defaultalias, ff, 
                           keypass.toCharArray(),
                           certs );
            System.out.println ("Key and certificate stored.");
            System.out.println ("Alias:"+defaultalias+"  Password:"+keypass);
            ks.store(new FileOutputStream ( keystorename ),
                     keypass.toCharArray());
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}// KeyStore
