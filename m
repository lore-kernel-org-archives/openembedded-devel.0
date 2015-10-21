Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id DC306766F3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 14:01:21 +0000 (UTC)
Received: by wicfx6 with SMTP id fx6so92843438wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 07:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-type:content-transfer-encoding;
	bh=YMaHkDhQrC2mdJICTXNcLqJjWq1jGuDp1jjX36SQMss=;
	b=ML4gni+SDkRrI15LtyY9SE0eisa67NbwQ70PH0l081VhekMbi2YRL6tK9q1olP7bop
	VhAufx/EflZJgVLw0xAI/2IcSprcG4ktbapi36uHW60J/WQzWKQeMs90PAp8cTkcq2Z2
	HfSn5r6r2sBSIspvZMyRQ+BuuGvOsI0d18arjZkaB6ECWigcwiLQ5Qz/UGP3c5h6nBkx
	PIb5WEXr4XlVi5TNLq4CVb0BoUgLnqDzO+jcZ7FugYOdvz+zLq0n/ju2Z0uUPjQD7PoM
	mZi0LYDv8Q1QhYsmzTNad1w//EYL5IhIreWiI7EZcDr2Q8FnlErtlRdg629K58Cl0JBp
	HdWw==
X-Gm-Message-State: ALoCoQmos/CBwsUAa6ijepcREx7Thbj7IuViwCZfdT1V8yN4PlBBYsyEpGd6OYOXFSddzNvnnOle
X-Received: by 10.180.11.1 with SMTP id m1mr36077564wib.69.1445436081364;
	Wed, 21 Oct 2015 07:01:21 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	jh4sm6153472wjb.33.2015.10.21.07.01.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Oct 2015 07:01:20 -0700 (PDT)
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
From: Steffen Sledz <sledz@dresearch-fe.de>
X-Enigmail-Draft-Status: N1110
Message-ID: <56279AAF.4050704@dresearch-fe.de>
Date: Wed, 21 Oct 2015 16:01:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
Subject: cups-filters
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
X-List-Received-Date: Wed, 21 Oct 2015 14:01:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Does anybody know about a recipe providing cups-filters?

http://layers.openembedded.org was not really helpful here.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

