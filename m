Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pp8ad-0002Zj-N1
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 01:16:23 +0100
Received: by bwz10 with SMTP id 10so5779370bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 16:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=86XAzTn65djViFkn8lu411dTtZSu8LlVHSQzkHVdLh4=;
	b=M1annBmUSlQePvMyf/pEraxSVYyxRbiZcPoLKKs6p9qsr9uRzYSxcCCJcrrjBVRwiu
	tkjiQln6o/LoFpvDlQSJZg3gCs8wzOHOrwEKep+t3TF1Ry0Ef0lTrvqHrRujkMqF8Ph+
	w5w1VBlVp5WnGZUjaKsaN+L73VZnAm3u/F/Go=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=KtRJNEuhv0LGiVq4dohiPEH814GLbVDtxSrYx+9x1CeNpLtgxT9kSMs74UwlRX2Dbn
	whJOWoLxXJ/5+FC/KBa8mg0M2qkmlv2D31N9wAmuRrDT+Vp/6IAGm5HPFCd/ZWMwtzIN
	xW+5MxUwysfOyP5D5IQXOAb4rxutK/sHMSlN0=
MIME-Version: 1.0
Received: by 10.204.124.6 with SMTP id s6mr3860666bkr.51.1297728914063; Mon,
	14 Feb 2011 16:15:14 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Mon, 14 Feb 2011 16:15:14 -0800 (PST)
Date: Tue, 15 Feb 2011 00:15:14 +0000
X-Google-Sender-Auth: XtT2HsG4wqO4WSafh2vs9TeWe4w
Message-ID: <AANLkTinN1b=egyKPv6N3rHq1HODKDyK15B22=1qBZcMZ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [RFH] qt4-tools-sdk not providing right values
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
X-List-Received-Date: Tue, 15 Feb 2011 00:16:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

CMake (that is being used more and more for qt applications) depends
on qmake -query values to "detect" qt and headers. Do someone know how
we can address it so a fully working Qt SDK that works with qmake can
be done?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


