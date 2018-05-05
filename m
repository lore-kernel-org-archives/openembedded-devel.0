Return-Path: <paul@betafive.co.uk>
X-Greylist: delayed 571 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 05 May 2018 07:08:20 UTC
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 357C474C99
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 May 2018 07:08:20 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 1AD9521394
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 May 2018 02:58:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Sat, 05 May 2018 02:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=1IGrzQxzqISMD0v1URYG7RhgArGRwdTq0ZWvHIWK+FM=; b=gj+bn+va
	1FSTJGJKHThM1j2qHbbXC2DgLTmDICLffrJTU2sbLPGWGSiycUf7+bP1f/cr5zns
	aX+rhua7AF6IOroZD2hd75BCRCbOCsLfOJQ0T2WzE4WbEhWP2NxFOoI6uzEyItg2
	Cqh2lOEyyM6yK0pxEjZ5rboripIa5JCUe+OnI2tztfwI0fHhnCtD+q9b1E8gu7/O
	Uq8VMYOtZmX+/1mcx8MZff5ImQZXpRkifv/ySjgcF3hlPMkK5vxaQzU69azAxWqy
	Z0aK6AK6ACtMl3eAs4zqxAEPjKfoUpmCT8YIpigmtMYlVgVb4GE7WKG1cqI52jAj
	HLoD+jp562K7UQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=1IGrzQxzqISMD0v1URYG7RhgArGRw
	dTq0ZWvHIWK+FM=; b=B5z99/HiKJU2FXr1/9MXq+PY4/2srCoOUcN+fP2UGgsrR
	jCFiFhiZsn6JBADsU25hQ/L+xiPRoO+XJrbNNq7TB2LV4gZnq7NlyGkAXge7wnki
	MK06W/FL0sHcGrrABQz0UG+7PPIFTofqmR0AQL7882+xjVTNhNie4m2csku9hqf/
	2cnSgmVvqLuxHxOlJHFo0ege0lVu9E2wmWVfka/CS0kn+jLXi7VHSPQOBVa9NAi8
	78LjZ+erxq/T5WJVG9j+Fl376l+UJLuykZboAh1vqS+EZzARhcw78ROx8NjsB0X5
	s838eiYbZ2EV1wl3AJayksI/boDWJDvNI3HEnnm9A==
X-ME-Sender: <xms:KFbtWnoACVjctKXoUYPHD5B6dyXfI26pnGgNz6n-JFHRu4oceQ_5Dg>
Received: from host0.betafive.co.uk (138.32.187.81.in-addr.arpa
	[81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7052A10255
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 May 2018 02:58:48 -0400 (EDT)
Date: Sat, 5 May 2018 07:58:46 +0100
From: Paul Barker <paul@betafive.co.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20180505075846.2cc93c8d@host0.betafive.co.uk>
Organization: Beta Five Ltd
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: [meta-openembedded] Sumo branch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 May 2018 07:08:21 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

In openembedded-core, master has now diverged from sumo and now
contains some major upgrades. Could we get a sumo branch in
meta-openembedded to align with sumo on oe-core?

Cheers,

-- 
Paul Barker
Beta Five Ltd

