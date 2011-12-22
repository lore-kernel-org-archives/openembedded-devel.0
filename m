Received: from nm17.access.bullet.mail.sp2.yahoo.com ([98.139.44.144])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <jesse@celestialaudio.com>) id 1RdenK-0008Gl-9g
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Dec 2011 10:18:37 +0100
Received: from [98.139.44.97] by nm17.access.bullet.mail.sp2.yahoo.com with
	NNFMP; 22 Dec 2011 09:08:17 -0000
Received: from [98.139.44.69] by tm2.access.bullet.mail.sp2.yahoo.com with
	NNFMP; 22 Dec 2011 09:08:17 -0000
Received: from [127.0.0.1] by omp1006.access.mail.sp2.yahoo.com with NNFMP;
	22 Dec 2011 09:08:17 -0000
X-Yahoo-Newman-Id: 347771.1246.bm@omp1006.access.mail.sp2.yahoo.com
Received: (qmail 93185 invoked from network); 22 Dec 2011 09:08:16 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1324544896; bh=iSfXPmprmg+OPoyBHydzt+Oht6Ye7jGFD0LvlGv3B5s=;
	h=X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:Received:Message-ID:Date:From:User-Agent:MIME-Version:To:CC:Subject:Content-Type:Content-Transfer-Encoding;
	b=GjX6MhZfzL9kESDcicb+abSuwNZkP7nyQrLUqk0XLC93BK9SI1gzPInqzRIoJxPtnPv/hOIV0HpBNICs5W+CV76owb+DndQl9cOiEyUkc28iejFDgRYSp4FMlm4V8aAUPoDrNbfuIjeC72sKhD1OM+7f5JlO8rCqWMfE2LMtXJg=
X-Yahoo-Newman-Property: ymail-3
X-YMail-OSG: dCTIFtsVM1nA08GEu5co1Fl2NG42fd3989exPCxl40PKQ8b
	37ZFl0ov6x.DXZE6dIJ1fWAf2hNSsaUSJ5Fcagkb2ajBktoDzOBnt2Kt4Lz5
	GvHfxuIYO0zhKQ4Vv2fMJ1ynzbbwBJ9U6oBPfpLsLfXLmChd8piRTmFoclmv
	4xjBCtCoDuyi183uOGqJkZHxCsDSwOqygeLCpyxkF4pYuyyJFcR6u7Tv6AV5
	zPNy1rwEWmbTSfKG71xCxMP1XZ30fNocPsljuy_UMaCXM8n9sBzi4YHyD5Oe
	WzNI3zppS4pmQjE9nV9C5roL43voWJMKAEwci_tWzx8BqqDaMMmmTG9g14fS
	aqS9mOARZl6CE_7D4hhdP7otQdmyXcu5_4WAyZZdulZGf4zsHzRu31JORMRi
	Zl7Yz0itAvkNU1ktuze4m3hkKx7m4uUMfZcvLp_ON36VVdUMeIgkG
X-Yahoo-SMTP: EvXGd.2swBBthDSY4mkIP5t97F2eRma9yhZSmUuF0tN2
Received: from [192.168.1.136] (jesse@76.102.136.108 with plain)
	by smtp108.sbc.mail.gq1.yahoo.com with SMTP;
	22 Dec 2011 01:08:16 -0800 PST
Message-ID: <4EF2F380.80704@celestialaudio.com>
Date: Thu, 22 Dec 2011 01:08:16 -0800
From: Jesse Lackey <jesse@celestialaudio.com>
User-Agent: Mozilla/5.0 (Windows NT 5.1;
	rv:8.0.1) Gecko/20111121 Firefox/8.0.1 SeaMonkey/2.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: fakeroot 1.15.1 issues
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
X-List-Received-Date: Thu, 22 Dec 2011 09:18:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm have exactly the same problem.  "git pull" says up to date.

I'm continuing on by running "bitbake -k".  But things appear to be 
indeed broken, by the presumably recent removal of 
fakeroot_1.15.1.orig.tar.bz2 from the debian ftp site.

Any assistance greatly appreciated.  I'm a total newbie with bitbake and OE.

J

> Christopher Sarra chris.sarra at gmail.com
> Wed Dec 21 20:52:32 CET 2011

> I tried `git pull` but apparently everything is "Already up-to-date." Am I
> missing something else?
>
> Thanks,
> Chris
>


