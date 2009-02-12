Received: from [209.85.220.17] (helo=mail-fx0-f17.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LXdob-0001SI-KS
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 16:49:25 +0100
Received: by fxm10 with SMTP id 10so1456090fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2009 07:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=+wHq76WDMXiCN/TuO2K1JYgNKvGeClBY3FCCnUyiqyM=;
	b=ZE2KZz2XKZW0JQh1li9cByqBSLJQVmkyKLw9BB0EEtuPD/A8+HzzROIMVYuwGi4GZR
	2TSNgeDl+q4KSGn5NKRCa5XzO7K3YCfJLqEX0/U6kMI1LktsCiR8Yp+oqK+wH55WXySW
	S9sOVtt478xg6wm0xKxhp3s5nkCx9doUEo5Yk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=LYH4yXjMaKa+hOxhRCToKPseRIRDaKmSU9g9AY9iT9mSpx2GYl6iSsvM78CMAv3Ix7
	tQzRO+bcmEkfqz6dWWGy8C8nRWsf+GDIWsfYeYw8APd2kz2r4k0m6j77ed4FGeIVKG+z
	BryIgVPQHWUrPDW6Psw775aD+d9TF9Nc46HSQ=
MIME-Version: 1.0
Received: by 10.180.222.14 with SMTP id u14mr346669bkg.141.1234453610342; Thu, 
	12 Feb 2009 07:46:50 -0800 (PST)
Date: Thu, 12 Feb 2009 16:46:50 +0100
Message-ID: <c384c5ea0902120746r2ff7a7f0o972e5e1d370fcbc5@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [RFC] OpenEmbedded name tags (for shows, events)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Feb 2009 15:49:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

on events we plan to walk around carrying OpenEmbedded name tags.
It will feature the new logo, with the openembedded name underneath.

Then, in a consistent (but probably different typeface) your name,
which is completed with a (possibly personal tagline).

I will create a executable C file that generates a PDF that you can
bring to the print shop to print 20-something name tags.
I will create this project inside the contrib/ folder.

Also, I would like to add a file there containing well-known
developers and/or users, as an input file.

Everybody please list their names (optionally with IRC nick) and a tagline.

          /OE\
   openembedded
Leon Woestenberg
 just a happy user

Leon 'likewise' Woestenberg
     non-core developer

Leon 'likewise' Woestenberg
    really core developer

Leon Woestenberg
    bitbake bully

Leon Woestenberg
     build monkey


Ideas/wishes/feedback?

Regards,
-- 
Leon


