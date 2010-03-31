Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Nwws5-0004Mh-Qn
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 14:18:11 +0200
Received: by pwj5 with SMTP id 5so16044pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 05:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=FXXOmwbDqX0qcFX/YWDqn+Wzl881N17bKBiRhbhI0m8=;
	b=CDFi385qgJNM3U6Wy5S5bJhb+yW4M4mSH2YRX3hfMlIwkB5aPU2l0WqJ6eT/Nm/JaA
	+Qgl5+wjhMJ4/hZg0ziS/CUKhW/r5wLSNRx0SzKFYb3dbiGLsNvU1tUTSZtJcvjFObOq
	/Sn0Ef0MLOPKdFcGxhkdFfKTIVHuCYOpV+J1Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WWo0oqZ1volv/YGoxuEnXhqP46XbyK/AiIZmynkUo1S3ZCcLjbq2GxkHIPVvfKwOf3
	g7xxQ1uAeutZzeOwT4DH/8eUR60cdRXbLQPqjYKOW1FKbp1Z1AOMOspbiRqwG3KoJhLO
	YwvWitGh2kPvr0navUuFnEaAnqhpeTAE7ayCM=
MIME-Version: 1.0
Received: by 10.141.34.13 with HTTP; Wed, 31 Mar 2010 05:14:53 -0700 (PDT)
In-Reply-To: <E1NwwjN-0002ZP-Tv@melo.openembedded.org>
References: <bug-5427-13@http.bugs.openembedded.org/>
	<E1NwwjN-0002ZP-Tv@melo.openembedded.org>
Date: Wed, 31 Mar 2010 14:14:53 +0200
Received: by 10.140.56.7 with SMTP id e7mr2357154rva.8.1270037693244; Wed, 31 
	Mar 2010 05:14:53 -0700 (PDT)
Message-ID: <l2xd1b08f941003310514u784a9109lb18a94f9bd4bded4@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [oe-commits] [Bug 5427] tzcode-native_2010f.bb fails, as tzcode2010f 	pacakge is not available
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
X-List-Received-Date: Wed, 31 Mar 2010 12:18:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ----------
From:  <bugzilla-daemon@git.openembedded.org>
Date: Wed, Mar 31, 2010 at 2:09 PM
Subject: [oe-commits] [Bug 5427] tzcode-native_2010f.bb fails, as
tzcode2010f pacakge is not available
To: openembedded-commits@lists.openembedded.org


http://bugs.openembedded.org/show_bug.cgi?id=3D5427





--- Comment #1 from Michal stawinski <nazgee@gmail.com> =A02010-03-31 12:09=
:09 ---
http://sources.openembedded.org//tzdata2010f.tar.gz
http://www.angstrom-distribution.org/unstable/sources/tzdata2010f.tar.gz
http://mirrors.openembedded.org//tzdata2010f.tar.gz

do not work. 2010f vesion can be downloaded from web, but it is not a
comfortable way to go with.

--
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=3Demail
------- You are receiving this mail because: -------
You are the assignee for the bug.

_______________________________________________
Openembedded-commits mailing list
Openembedded-commits@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits


