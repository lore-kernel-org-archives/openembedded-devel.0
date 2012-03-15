Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1S887f-00008R-13
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 11:41:31 +0100
Received: by bkcjg15 with SMTP id jg15so2151939bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2012 03:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:x-enigmail-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=raXrfxYjCD0qDwPRE/rTsCwwMuWTYO4jEYqvN4w6340=;
	b=F2Uf1utFqgHYDbVxwjm7tjcxK5yLjZfUmGPGJip1qDm6fTpy2HmpA03wfyzup1cuea
	OZY6mZUOjuLj856bKYXuQIq4ONOnt6qGafgLeYHfj20NpI4eCVPrHr6L9pPwjvzWMD3R
	sL0dNvp0zy1AqErFus6o/lo0SYQOli3d3S7W2Oeny7rWnu4OwkdJtFideZLc91oyHJEQ
	r223FJJ3TV0OBZ7/n6KAGRSj9mzhWlOp6B0zHfYeocmksckpWRIFfptGywjo6oFaxAhM
	pBkGRyTel9DF8Caji3V9OReTBT0MTA8jxO7+tuqpKqZQcv/1VvAhXmIE5RBq6+yMUddL
	l9ew==
Received: by 10.204.9.198 with SMTP id m6mr2193301bkm.38.1331807564682;
	Thu, 15 Mar 2012 03:32:44 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id bw9sm2781874bkb.8.2012.03.15.03.32.43
	(version=SSLv3 cipher=OTHER); Thu, 15 Mar 2012 03:32:44 -0700 (PDT)
Message-ID: <4F61C54B.1000609@dresearch-fe.de>
Date: Thu, 15 Mar 2012 11:32:43 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 1.4
X-Gm-Message-State: ALoCoQlW5eic7bld5QoP4sN4T6gHMxjr8Kb0o8FLgmKUIbt+pPbuYnvoPPPCXIGrbqCyjq4i8hXk
Subject: libmatthew-java-0.7.1.tar.gz not fetchable
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
X-List-Received-Date: Thu, 15 Mar 2012 10:41:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

libmatthew-java-0.7.1.tar.gz (used in 2011.03-maintenance branch) is no longer fetchable from it's original location (the maintainer provides the latests version only). And i did not found another reliable source.

Can someone put the tarball into the OE and/or Angstrom mirrors?

Thx,
Steffen

PS: I can send the tarball on request.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


