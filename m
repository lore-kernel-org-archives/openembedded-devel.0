Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 521B375CF1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 00:27:34 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so215196266ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 17:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=QByGerULgenOiN7iYL5nfmcWFh5U3LG9oFmxAGr5RxE=;
	b=BBpYugmic5CaBU/i9CAI6zNtiOryrymQfY7PsrzBJSZzgDsVyT/r/KF3aGyH5T4YNr
	Bor+Vlron1K8N1EJGOp6UxvOuJIQrvuQrhvxot+xysidJ8BlmFTMY61PH4LTv4pra3AV
	BhZLdspPui06VPSog5jblU5EndDZh4JdMMN/WaVDLcp4m9QDyUd2yJIX4mke74kRhI9A
	cHkabInlMwvTyyQew1EA+e9K1JxetE1wNUjei1tjUHwOVe3cXLL8/GtLK6ic3oQT3JIy
	Oc67uCp4r/qg8/SVZsCjMdWgwG26Ku1Gt6j9W/++aOYafukXaPuDmExpZPF0DRaYZq6P
	grOw==
X-Gm-Message-State: ALoCoQnC31jbsDkRDb/hW8JTMEGzQS/IggY/hojGqMke4nCHDYO2nG4DSLPTtoGDBx2AfofIXGPF
X-Received: by 10.107.137.106 with SMTP id l103mr33272800iod.112.1442363254889;
	Tue, 15 Sep 2015 17:27:34 -0700 (PDT)
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com.
	[209.85.223.182]) by smtp.gmail.com with ESMTPSA id
	c203sm8122954ioe.9.2015.09.15.17.27.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Sep 2015 17:27:33 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofh134 with SMTP id h134so216075050iof.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 17:27:33 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.160.194 with SMTP id j185mr36968380ioe.37.1442363253281; 
	Tue, 15 Sep 2015 17:27:33 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 15 Sep 2015 17:27:33 -0700 (PDT)
In-Reply-To: <1442362319-21396-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1442362319-21396-1-git-send-email-fabio.berton@ossystems.com.br>
Date: Tue, 15 Sep 2015 21:27:33 -0300
Message-ID: <CAP9ODKowNDXZ8MUhh2d0qFy-5Y=1u8+SRVqAFCNWqW3NZU_qJg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: Re: [meta-networking][PATCH v3] lldpd: Add recipe
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
X-List-Received-Date: Wed, 16 Sep 2015 00:27:36 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 15, 2015 at 9:11 PM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> lldpd is a 802.1AB implementation, a L2 network discovery protocol.
> It also supports CDP, EDP and various other protocols.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

