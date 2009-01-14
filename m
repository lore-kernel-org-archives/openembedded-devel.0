Received: from [209.85.219.20] (helo=mail-ew0-f20.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <norguhtar@gmail.com>) id 1LN4mM-0005Pw-Uq
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jan 2009 13:23:27 +0100
Received: by ewy13 with SMTP id 13so562338ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jan 2009 04:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type:references;
	bh=DOrRyTNwZRpvZypR9a1Xi2bxcbXh8/YOCab8BRw35ZU=;
	b=OOSqsf4JRwSiVSWRHienbCXP/gBbT7sxZisKFFQTnW1F3LZQVQwenKBCZGaz4k2gwi
	HR0v6oIGunCyl4pU3INNiL8xn/dkR7CcUAJP7/B+8d3pQp7z1J+EVodKRvzlu3OAHh99
	Qm7kl+t+R22xbMQHBlY/e1eOI7FV2peKYqNtk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:references;
	b=QjbeHJWbfabo17E1N8JoVBbJWiPZOvesHvduVtVbKtvaBvgv15xH/BJBj/biBU0qY+
	G4PkgFZISKqrloDN4tigKa+0gNe90g1rx/KnCiu2fEUNdjZL1mhKupaGq2XbFG8u5dNV
	xeNlfKt29wTagtVrKuVWEeLMhgTv0rXDHjIQU=
Received: by 10.210.35.10 with SMTP id i10mr8719ebi.124.1231935410199;
	Wed, 14 Jan 2009 04:16:50 -0800 (PST)
Received: by 10.210.11.14 with HTTP; Wed, 14 Jan 2009 04:16:50 -0800 (PST)
Message-ID: <1fea892d0901140416p6cfcf853k742b23c24ac8a59b@mail.gmail.com>
Date: Wed, 14 Jan 2009 17:16:50 +0500
From: "Anatoly Shipitsin" <norguhtar@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <496CFA6B.5060108@gmail.com>
MIME-Version: 1.0
References: <496CFA6B.5060108@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Ipaq 31x ...
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
X-List-Received-Date: Wed, 14 Jan 2009 12:23:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jan 14, 2009 at 01:32, Jdatalog converter <
jdatalog.converter@gmail.com> wrote:

>
> Hello all,
>
> I'm interested to run Linux on my Ipaq 314 based on following platform :
> http://www.sirf.com/products/SiRFtitanProductInsert.pdf
>
> I don't know how to create a new file in platform subdir.
>
> After long search on the net i need some help.
>
See conf/distro/minimal.conf

