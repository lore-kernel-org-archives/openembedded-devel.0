Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1TLB0a-0005Xv-N3
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Oct 2012 12:56:24 +0200
Received: by mail-la0-f47.google.com with SMTP id h5so1961163lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Oct 2012 03:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:x-enigmail-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=0e7vOy/CQ0Z5j6lxOFG9UyISP9ztJjYDbjPd8mqxN/I=;
	b=oQQsRoeMbWqwVROPl3QZm/kwrus46UMGPyYEV0rRBrFYp9EQ3s5b8PgycVQ+HhdyLH
	qOXSH8LNKq6pIk+9opJc05JN7ldkHWxX3SRaJqJHeYehlV2/lhsq9JJkjRxpme+20dY+
	gN5ORSCK5DadIC3SJmHVAD+BQ9vpEmcPz6OHfD/x/wGpE74Q7Ppce7ylj2rcYQ2fLPVM
	NiCGvxwF3gGSo46IAsbYyYbjconI6E5Ouf9q1jJ7Dkh9YOPsOUljViR8iMwrCX04P6F2
	GBLpGdSAYrFI1edzzc2iwdRPfTLRta56l44YVEhxP00HvZX0IqZMAcfJBw2JRR88FfR3
	QMfQ==
Received: by 10.112.42.37 with SMTP id k5mr6449193lbl.110.1349692998604;
	Mon, 08 Oct 2012 03:43:18 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPS id oj5sm5349545lab.8.2012.10.08.03.43.17
	(version=SSLv3 cipher=OTHER); Mon, 08 Oct 2012 03:43:17 -0700 (PDT)
Message-ID: <5072AE42.6060201@dresearch-fe.de>
Date: Mon, 08 Oct 2012 12:43:14 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120825 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Henning Heinold <heinold@inf.fu-berlin.de>
X-Enigmail-Version: 1.4.4
X-Gm-Message-State: ALoCoQk7Asfe1Kda6vakZDsGXap+HJI/0FF+fyKYPlqxsiXJeUNO1gS/Rs5q/duz7XnMAETpD5KF
Subject: llvm vs. meta-java
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
X-List-Received-Date: Mon, 08 Oct 2012 10:56:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi meta-java maintainers,

should llvm really be part of meta-java/recipes-core?

I believe this involves a great danger of conflicts with other layers.

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


