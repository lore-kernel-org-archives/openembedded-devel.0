Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1UNgYU-0003Tz-CW
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 11:34:04 +0200
Received: by mail-da0-f52.google.com with SMTP id f10so1050957dak.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Apr 2013 02:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=B0PefsrjrgvKvVTjjD24DHlQ1JWalaQx8RswctXS0t4=;
	b=KLPoIaXN9UFSfU5I8EJmhLDvP0DvTJbtOew3OGgmXrMAHXjiuqiOe5OcoDwxMIlAdx
	f4vFO2J/hVy8Y8RCGZrl147MlSENC+57/6HN/euKaN+OXkASY+py2oi3H+ZTQK/Ordl9
	oqHrrz5UEOF4TFZkkgnQIwgpEDk7E5yX865E6nOUvz8Bvnkv+Y7kvAMDYKRGdFqEu+6e
	Dvc7/a79ymir7qGtBssoLsfZtGn01zQsSfGDrORsNJHR7sXtyNtGVVdJW/NMaV3JXFnu
	6mMWh2YQMpJGz9Y4QnOGnilzCSb8LumvWZ2iPsW1DdCqHDOTLEkyGDFTf+HPQIobUJsg
	Oadg==
X-Received: by 10.66.162.103 with SMTP id xz7mr8315233pab.2.1365067007247;
	Thu, 04 Apr 2013 02:16:47 -0700 (PDT)
Received: from [192.168.1.100] ([94.205.105.6])
	by mx.google.com with ESMTPS id mz8sm9518240pbc.9.2013.04.04.02.16.44
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 02:16:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <B42120AF-E508-4363-8249-E94E10A2957D@gmail.com>
Date: Thu, 4 Apr 2013 13:16:41 +0400
Message-Id: <F81A0AC1-9DA1-4A74-949D-94FA709BFD43@gmail.com>
References: <1364545389-20291-1-git-send-email-elvis.dowson@gmail.com>
	<B42120AF-E508-4363-8249-E94E10A2957D@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [v2] gcc-4.8: Refactor gcc-4.8.0 patch files.
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
X-List-Received-Date: Thu, 04 Apr 2013 09:34:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 4, 2013, at 11:41 AM, Khem Raj <raj.khem@gmail.com> wrote:

> I have staged this patch in =
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc-4.=
8

Thanks, Khem!

Could we do the same for the gcc-4.7 patches, as well, as those recipes =
are updated for 4.7.3 and newer, and subsequently retired to the =
meta-openembedded/toolchain layer?

Elvis Dowson=


