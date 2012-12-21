Received: from mail-ie0-f172.google.com ([209.85.223.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <munoz0raul@gmail.com>) id 1Tm1ur-0003IS-TP
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 13:41:30 +0100
Received: by mail-ie0-f172.google.com with SMTP id c13so6047482ieb.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 04:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=QnAELhGjy23EHFrSRsVHA7YRLjzDmf5DfgR4oo/lVt8=;
	b=0xBxsbSX/FZrrW6rh0CKOuz6AVFBBm4AwKKDIcqwTARPHV7OB3fmCTePOMc0HFm7JF
	+APy3Xn3JaDHliLhcC8e900+xrAho7yf4P9BSBoIziBostnO7XGcy04WU3XY2jwpHrp4
	AceO50fHNDyalS4IEzHa19cEwclZXGqSmt6M15LNIPKPBGrgtNB4nOh5d+3EEta4zgjp
	TXbzf4bAa8SlBOCyo121/16/8Nu83ubsygp+w5tP8MG/V1b44NdLq2R3H1XEv8Q++icK
	j008CbfngFT8hq2cYKep10U7/jZ1r9KHQcaP4n6dz84cwc7BLdjYsggVsdx4WQ4iO+pf
	wRDg==
MIME-Version: 1.0
Received: by 10.50.106.199 with SMTP id gw7mr12953864igb.26.1356092803613;
	Fri, 21 Dec 2012 04:26:43 -0800 (PST)
Received: by 10.64.147.40 with HTTP; Fri, 21 Dec 2012 04:26:43 -0800 (PST)
Date: Fri, 21 Dec 2012 10:26:43 -0200
Message-ID: <CANmVirjmVO0XS5E4-_E_=cp02MCY-WQKUHnGEMtYfddEFmewZg@mail.gmail.com>
From: Raul Rosetto Munoz <munoz0raul@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: llvm2.9 install error
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
X-List-Received-Date: Fri, 21 Dec 2012 12:41:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello all,

I want install openjdk-6-jre in my imx28evk.

I have this error when I try install llvm2.9 in my core-image-minimal.

At bitbake core-image-minimal:

This is the log error:

NOTE: Checking Package: libllvm-llvmipo
NOTE: Checking Package: libllvm-gtest
NOTE: Checking Package: libllvm-gtest-main
ERROR: QA run found fatal errors. Please consider fixing them.
DEBUG: Python function do_package_qa finished
DEBUG: Python function do_package finished
ERROR: Function failed: do_package_qa

Some one can help me?

Thanks.

--=20
*Raul Rosetto Mu=F1oz*

