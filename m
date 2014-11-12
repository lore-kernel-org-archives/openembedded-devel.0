Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 18F2D62252
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 22:04:34 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id ft15so12949470pdb.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 14:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=mYkN3bJ4FP6DhEEOSmj2EqZGkpkgEN3PB89bP1S+XBE=;
	b=0bLLNKXm5l+6ZrV0iiGlKXBVUAvl962j1eIjTOfnAPvlDZe9ls5+8FfEPeobesrvh9
	5e0V3uyLXpaO5C5Qga99lFyIfIXiiz6E+Apd201uJzfmlqyGpK0xMsBHcYPE/muNDc0j
	ZSLOLXnNwoXErbkkQOX8lyOMtSNjhF9Zl9Vj4XUP4n56FVRYhYXYxUE/qK4lLY/Itidp
	EkFhwkhph4OHFRMp4uwJB93+pxv3cdWtBXBM2sFlZ2h5RZ9iybErXq23RDU3/5FX4/j/
	Zhszi1PoFwIzknvoGinef9i25sO7zi9TGWZQBB2vQ6gDGDhwjD3P1Ky5ZW0IG5fynbR5
	suNw==
X-Received: by 10.66.241.239 with SMTP id wl15mr8563116pac.15.1415829875026;
	Wed, 12 Nov 2014 14:04:35 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:5d34:bd2e:5ccb:3cce?
	([2601:c:9380:601:5d34:bd2e:5ccb:3cce])
	by mx.google.com with ESMTPSA id
	ub7sm23035190pbc.30.2014.11.12.14.04.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Nov 2014 14:04:33 -0800 (PST)
Message-ID: <5463D96F.1000908@gmail.com>
Date: Wed, 12 Nov 2014 14:04:31 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: wireshark
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
X-List-Received-Date: Wed, 12 Nov 2014 22:04:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I am working in wireshark to 1.12.2 update ( trying to avoid dup work). 
I contains several security fixes.

Hope to have it posted today.

- Armin

