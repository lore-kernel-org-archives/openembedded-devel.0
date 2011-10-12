Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mgargela@gmail.com>) id 1RDxv7-0007Jp-MI
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 14:28:25 +0200
Received: by gyg8 with SMTP id 8so611411gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 05:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=WpNScfsIKooW/SmB5F9x5nCZleobx6DQULTIV8dRcKk=;
	b=Sie67z+035HNB/IcoVbLR8H4sR9WkjEXBRaYpqMhIa+DQl3viP0FQITJes1Q8i782M
	LdXNGKCDuqw8xRijgvev+Vxo+sLX1P/PW29J5cKTpHFWuiE/UCCgG0bHG8cvKTvKvc8z
	Rmk5cjBSIiTocrhSsO2AWGugYTTp3Xl07YGFM=
MIME-Version: 1.0
Received: by 10.236.79.170 with SMTP id i30mr35837800yhe.94.1318422154715;
	Wed, 12 Oct 2011 05:22:34 -0700 (PDT)
Sender: mgargela@gmail.com
Received: by 10.236.103.146 with HTTP; Wed, 12 Oct 2011 05:22:34 -0700 (PDT)
Date: Wed, 12 Oct 2011 15:22:34 +0300
X-Google-Sender-Auth: O7K56DmrSS0FGuh6NFjCldaCdPE
Message-ID: <CAObi9r9=55i4W686VfCv-TGSChsrewu7zSGUsPZC2PbA3x3zbQ@mail.gmail.com>
From: mgundes <mgcse@hotmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Creating Rootfs images without packages
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
X-List-Received-Date: Wed, 12 Oct 2011 12:28:25 -0000
Content-Type: text/plain; charset=UTF-8

   Hi,

   I think one of the big issue with OE is build time. It does everything
for you, so that it takes too much times. I want to minimize build time and
realized that OE creates ipkgs for almost every package. If there is a way
to prevent creation of ipkgs it would be really good for me. In my opinion,
it would be fine for other people too since usually rootfs directory is
enough and ipkgs are not frequently used directly by developers.

   I have asked in freenode oe room but friends said there no way to do that
in OE system. If there is no way to do that in current OE, do you plan to
add as a feature?

   Thanks,

Regards

-- 
MahmutG

