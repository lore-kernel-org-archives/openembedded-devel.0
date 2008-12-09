Received: from [209.85.198.247] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1LA5tZ-0002p8-Gk
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Dec 2008 17:57:13 +0100
Received: by rv-out-0708.google.com with SMTP id f25so34735rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Dec 2008 08:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=brHDDkVvlr0BDIB/MdJpyjjCzTs74iQ7mFd+FyI8Ayk=;
	b=qCf6g88tY5tj9y+R9XE/GTxr88fDYkGtidQRhn5lwAsmDdy3CgfGAh2r4GWoteaNNW
	/4d9pWnjRbXn8oi441FMO1T/HH75xA+39fdoSFzbsOoNbY77UnI44vDx5ckPB40EWh7t
	eD1HQV7G1GCUE2C+JnN6p++jFuj9pFN2yPDtM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=VRFl0Wo2LSmR3YRbJWP9iYKjuLeP1TGQCAUPNtJrgSPgWaapgyPOapn+PAWL2o6UCR
	IpiDu/U8imwRJXYkrzjemVsLhocZJSH7Znt5os8FmjDG8VThdJM1efMfDFuJ5evffqOK
	L6haSVLS2Am5PToU3XzCc6C3rMrgs+PgsooC4=
Received: by 10.141.153.16 with SMTP id f16mr134928rvo.283.1228841596161;
	Tue, 09 Dec 2008 08:53:16 -0800 (PST)
Received: by 10.141.51.16 with HTTP; Tue, 9 Dec 2008 08:53:16 -0800 (PST)
Message-ID: <a7f8874a0812090853xc3d6155labc81400c4bf9372@mail.gmail.com>
Date: Tue, 9 Dec 2008 08:53:16 -0800
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: Uninstall bitbake
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
X-List-Received-Date: Tue, 09 Dec 2008 16:57:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,
I was wondering if there were any instructions out there on how to
"uninstall" bitbake. I have been using setup.py install to install it
on my machine so far, but I would like to experiment with trunk now,
so I would like to know which files I need to remove to make this
work. Thanks,

-- 
Henry von Tresckow (hvontres)


