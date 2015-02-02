Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2422F60017
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2015 18:33:22 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id fb1so85669094pad.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Feb 2015 10:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=4QuLNPUz+/t3vFTDM1LTvORgqAziwlbHjNj/oVdsGvs=;
	b=SuJp3W3C98Gusm5PGAf54DA2awb7FYuI2viuvgo4Rp1VzULoKsyEwfsCy5rnGAvoHC
	yu4zGuDb3hDENJtWosCDuWORzbaFr6REJyIvlB0U4g/RmQn/RWZ+I1lEf45E9fI26v5Z
	3YgDi41MP0GG4xVD5IhEgQO/GCNkRGVZFtfto48RnKdhxldmhk0iOnsIkmxwbYm0SxEP
	32tlDfzqGY65ahkARaPO0M1zE0jaI3vvwo+/Xi9kj84EqOBTjlYDlAAr4qE+NJDqFZ55
	q7qPMJA8PsNv2O4dTxt9crBITqvL3+xGnREsWD2UCAz1KCDc59aA7tS8R4XrfcssHzPF
	CzJQ==
X-Received: by 10.66.102.41 with SMTP id fl9mr31156029pab.7.1422902004232;
	Mon, 02 Feb 2015 10:33:24 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:c42b:9a19:c8d3:f701?
	([2601:c:a700:272f:c42b:9a19:c8d3:f701])
	by mx.google.com with ESMTPSA id
	ob4sm19521833pdb.48.2015.02.02.10.33.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Feb 2015 10:33:22 -0800 (PST)
Message-ID: <54CFC2ED.7040704@gmail.com>
Date: Mon, 02 Feb 2015 10:33:17 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: --should-not-have-used-
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
X-List-Received-Date: Mon, 02 Feb 2015 18:33:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



Hello,

I am now seeing an issue in one of my recipes during configure.

--should-not-have-used-/usr/bin/pcap-config


Is this indicating an issue with my recipe or with pcap?

binconfig-disabled.bbclass comments is not very helpful.

regards,
Armin

