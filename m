Return-Path: <switesh.fulpagare@mindastoneridge.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 498E871399
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 07:10:01 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id lf12so10018840vcb.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Sep 2014 00:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=CmIxhaTTxIOHZ8TysUVqinBfdPoJd2/h+OzKGMD52As=;
	b=IFlcrI0tkAfytiMCzon42ZlPtHlGWK57NRnup5w2Xeup2VqrP3TQLOndRndQArFWod
	SY6nD9GNIGv8DYNHcpYx668r27CzpLO3wb6OcZTqTpvHW2xPtGZuOl3MrGx/PctojJIC
	tilUWZ6u4VSMgVupeQmJLPOuf/Y3fMhRL2shYkLsAOKwocLMIWRiSDB/8V7YLSukhYEu
	WnrO979/gEf/T3vDYbg+4lq560NPIWfiIj9lIi106wIM3MzEUSsu3l2UZCNnSWaFsTbO
	DZDulKZ2GCikrG6U7gpCiRr+QCn56OZIQWMFs421lPW7S4P+2bqjIwoncE++u+jeR9T8
	HmrA==
X-Gm-Message-State: ALoCoQm8+DpHI5hUm+hS1M/03tNwgOueZjhluhIb7EGrVo2yszTSfDicUhe0nb/i01e2owq+hhv+tyQb8tUbu597bk8+YhiETmy4/ZwwB8nPRMUyyhCSnaKE1dLNEvdPTadrig3s905QUPcDWyCExhstC5SHjcliow==
MIME-Version: 1.0
X-Received: by 10.220.182.1 with SMTP id ca1mr1944811vcb.21.1409814602391;
	Thu, 04 Sep 2014 00:10:02 -0700 (PDT)
Received: by 10.52.245.73 with HTTP; Thu, 4 Sep 2014 00:10:02 -0700 (PDT)
Date: Thu, 4 Sep 2014 12:40:02 +0530
Message-ID: <CALRGHr-x0HHMz8paVPVFxmoZ41zRGBZ4GmY3N35VKfYx57v6Lg@mail.gmail.com>
From: Switesh Fulpagare <switesh.fulpagare@mindastoneridge.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Error while bitbake meta-toolchain-qt5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Sep 2014 07:10:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
 I am getting error while Building Qt5 using yocto on Wandboard refering to
the link
http://wiki.wandboard.org/index.php/Building_Qt5_using_yocto_on_Wandboard

At the time of
$ bitbake meta-toolchain-qt5

I am getting error, i have posted that error in wandboard forum -
http://forums.wandboard.org/viewtopic.php?f=3D10&t=3D573&p=3D2520&sid=3D45c=
e5e714aa2ae65ffc52cb7bedf31b3#p2520

Can you please look at this post? I think it is problem with 'git://
qt.gitorious.org/qt/qtwayland.git

Thanking you in advance.

- Switesh.

--=20
=E2=80=9CThe contents of this e-mail message and any attachments are confid=
ential=20
and are intended solely for addressee. The information may also be legally=
=20
privileged. This transmission is sent in trust, for the sole purpose of=20
delivery to the intended recipient. If you have received this transmission=
=20
in error, any use, reproduction or dissemination of this transmission is=20
strictly prohibited. If you are not the intended recipient, please=20
immediately notify the sender by reply e-mail or phone and delete this=20
message and its attachments, if any.=E2=80=9D

