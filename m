Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdVEs-0003kn-6e
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 01:38:38 +0200
Received: by dalh21 with SMTP id h21so3609742dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jun 2012 16:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=5PElnDtflP52skpQ1b/vuy/Asq3tNtuxHn57eh2+/vo=;
	b=ayGYMEMAGER4RyftwrTqgRKGFZ29AhJttVrdL8HFg10lRYH48zS6jBlgONOApsQQ+O
	vnXDuBvOpM2TfHrmykhXCy6PDOzWVK1jWrP8mhi4N19EPJ1EJ7UHp6PL3/CaTCVgqHho
	pyY/PIA9bADAv+Bf5ffF1OmfWsxGEz/AMoBgM+kBxP480QKRoF86gBSWWAz1+VHyrnJI
	NoGgEMXhHRG7dU8oeBMEtBFzjXFsOJ/CatviUJo/j6Ll7idDSw/eppMoYlU7WoHxG0IL
	sev+CR/L/GcqeJu1e7mRk/C8sRrBFUA0P1q/TmOk7Xrg7Pu+1jUHmSfPqj+7scFCoqj2
	E1DA==
Received: by 10.68.225.201 with SMTP id rm9mr10537811pbc.71.1339284485947;
	Sat, 09 Jun 2012 16:28:05 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id qn1sm12853027pbc.9.2012.06.09.16.28.04
	(version=SSLv3 cipher=OTHER); Sat, 09 Jun 2012 16:28:05 -0700 (PDT)
Message-ID: <4FD3DC0B.6010700@gmail.com>
Date: Sat, 09 Jun 2012 16:28:11 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CADqH6VxvxeF=UoY+JuN_JP+McpWAf8FoB5HZ-aprDG3PfpkdqQ@mail.gmail.com>
In-Reply-To: <CADqH6VxvxeF=UoY+JuN_JP+McpWAf8FoB5HZ-aprDG3PfpkdqQ@mail.gmail.com>
X-Enigmail-Version: 1.4.2
Subject: Re: libcurl and __isoc99_sscanf@GLIBC_2.7
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
X-List-Received-Date: Sat, 09 Jun 2012 23:38:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 6/7/2012 4:20 AM, Jaya Kumar wrote:
> I was wondering if that is correct behavior? I don't have an 
> understanding of why sscanf seems to have a dependency on glibc
> 2.7. I encountered this issue because I took the curl libs,
> unpacked them in my metatoolchain libs, and then tried to link my
> app against it and got:

how did you build those curl libs ?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/T3AsACgkQuwUzVZGdMxRGxACeIhDVeMCscvFuILcqWgV+S/ea
pDkAn3U821Abzz5+NSALyJV2j8vdmtXh
=jaA1
-----END PGP SIGNATURE-----


