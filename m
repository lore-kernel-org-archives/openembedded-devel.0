Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Oy4ri-0003Zo-J6
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 17:34:43 +0200
Received: by wwi14 with SMTP id 14so6723918wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 08:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=x4I3p7TkCnJ9KZjtfDRZ3ghXZTUwAsmilnLqHJ332jE=;
	b=xV/M3XD5tqU4CebGVZSosgFznW9sYzMVLyiLT4wzNE9OPqGmiiWmJfKKzd6UoQ54I6
	QuDAcJRFSiFxDZssYdUIFi3ql4sMaLdaaiWU07k68bzPSeuGUgA3fe0oBvop+zR1tM+5
	xOaQZHVQnyyNC8Dm9IpkBfLmLggHVpFU978BY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UwwXTgRqO4+GrW8EgDfIMUFtPp5/SbZOuhbDtTFSKuVcOWuJeetqu8ENcVjAZYYwFA
	Ggknls3lSYnVVhU9bnRGiM74ArOVaXxOTTRrplP/k7z83BfJbt16cpNol2X/ZSVacXQp
	kaIkBeZkvlP1d9rUmAUzDkYoNA2PJkrpaPJvQ=
MIME-Version: 1.0
Received: by 10.216.38.71 with SMTP id z49mr5804305wea.76.1285083264081; Tue,
	21 Sep 2010 08:34:24 -0700 (PDT)
Received: by 10.216.72.212 with HTTP; Tue, 21 Sep 2010 08:34:23 -0700 (PDT)
In-Reply-To: <20100921152505.GB3403@jama>
References: <AANLkTikDibG-qAf2b9U_OuOLbVXNP8QWouTEN7z_v25_@mail.gmail.com>
	<20100921152505.GB3403@jama>
Date: Tue, 21 Sep 2010 11:34:23 -0400
Message-ID: <AANLkTikTrRMX-5UAso2BgJ8-XqhwtXTnS_vT2Yt4FNnc@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: anyone working on recipes for qt 4.7.0 released?
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
X-List-Received-Date: Tue, 21 Sep 2010 15:34:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2010 at 11:25 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Tue, Sep 21, 2010 at 11:21:32AM -0400, Cliff Brake wrote:
>> Qt 4.7.0 is now released:
>>
>> http://labs.qt.nokia.com/2010/09/21/qt-4-7-0-now-available/
>>
>> Is anyone working on recipes for this yet? =A0I've been trying to get
>> 4.7.0-beta2 to build, so wondering if anyone has tried 4.7.0 released
>> yet.
>
> 4.7.0-beta2 is building and working for me (SHR) fine, but no time to
> work on 4.7.0 now, so would be great if someone else does that.

Just to verify and get a baseline, what all do you need to set to get
4.7.0-beta2 to build properly.  I'm trying:

ANGSTROM_QT_VERSION =3D "4.6.3+4.7.0-beta2"

Are you using the X11 or embedded version or Qt?

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


