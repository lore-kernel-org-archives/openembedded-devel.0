Received: from mail-ob0-f173.google.com ([209.85.214.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UTC2i-0006mC-Mz
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 16:12:01 +0200
Received: by mail-ob0-f173.google.com with SMTP id wn14so3468806obc.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Apr 2013 06:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:content-type;
	bh=YnH9NebD9hjksYLbGYQLv223UA8EV45KNngkH6DLDRU=;
	b=e9PNf4lzKHzJfTBaZj8P7y37vo4rJHpuh/CIgakseMrZTPHt7CwNLwrackGtIAdSXS
	i6SxSU7K9lIUTKjKhiSRHIGFBQojQk2/HBc32w8Df0yV3BJdH7O6IOcwCDFZ8u0xjLOq
	RJ6MAYAchzN0af5aAE+s3MhHuU2dyXHOyuclGfnpb6umG0RNt2I+JolKCam85u8YYa0R
	KSJvwypeTM1Ow5sH8/EOpCiZXGpjQlaragIDihFrIfAuE4TkVkr5FTAN5Zqh3l6EIpfz
	hLr2KMJ9ClowxeJ+hpCCfPQ3DdrzNNB+yX/BePDPmiwPjg6Xv30i86QiJJn564O0bzbN
	HFlg==
MIME-Version: 1.0
X-Received: by 10.60.37.36 with SMTP id v4mr3911270oej.53.1366379665560; Fri,
	19 Apr 2013 06:54:25 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Fri, 19 Apr 2013 06:54:25 -0700 (PDT)
Date: Fri, 19 Apr 2013 10:54:25 -0300
X-Google-Sender-Auth: 7i4Ru8kiqv6aYTjJSxWr2NTrydE
Message-ID: <CAP9ODKraNHQ1cwW8Q+aqqDJ1ChSg+5dqoPNe=dA=TZNALu-4kQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <ebenard@eukrea.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [for-danny] Changes for backporting
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
X-List-Received-Date: Fri, 19 Apr 2013 14:12:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Eric,

Now that our other list of changes has been merged, here goes a new one:

* 0d0f1de gnome-disk-utility: disable failing docs generation

* 7d75307 gnome-disk-utility: fix unpackaged files

* 1bceff8 libgsf: update to version 1.14.26

* b2aa32e goffice: update to version 0.10.1

* 413a9fb gnumeric: add recipe for version 1.12.0


--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


