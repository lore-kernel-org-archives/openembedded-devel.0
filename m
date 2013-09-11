Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id ADD7B62273
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2013 13:31:58 +0000 (UTC)
Received: by mail-ve0-f169.google.com with SMTP id db12so5957463veb.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2013 06:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=R0oNLJp/+7esaH6+A7AT7wE9uWQ724zUFk5uBCwbLXE=;
	b=YqXsOB6EvSw0Irs39xlYGawb+oVjFcxl6MMdEiJqq/vCm8NAshTaB5s2Yfe5ujKnRy
	RDOgZg5YZ+1jAxIke+8sg6VuY1fD+cdxKifpdbQl7UgeBL0Pa59pn2lxLTmlaW63rKUu
	1sRMPJzAzL0yHlzBjYZFr+/KKTdgezmCpvtRW95skUjiooX36fhMDF0vk5NF7E//cL7g
	qtPRlZmUYYib4/3GeZMIM+Tvzv7U2KE7jmwILjxYQge/VMk0TYe5zndEQEbB/sIK3BN2
	TH4Da0/Ubt7N49V7uoOc9YcDLnK2JDTnUm44cNeL0seCfPBoPeK4rOFtYUE0PGNO2pzF
	svyA==
X-Gm-Message-State: ALoCoQl9kOhO5uzSBdepywRxiwXERPORKr65q4GQ3qdSCMdrww8eHjtc+o+lGqL8PKlnvn11R6Sx
X-Received: by 10.220.164.70 with SMTP id d6mr1251226vcy.19.1378906320187;
	Wed, 11 Sep 2013 06:32:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 11 Sep 2013 06:31:40 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Sep 2013 14:31:40 +0100
Message-ID: <CAJTo0LZQM09ue4aWs-H4K94f+CsFUeTbFDA5mH4+aQQ=HdcHOQ@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Does meta-oe want imake?
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
X-List-Received-Date: Wed, 11 Sep 2013 13:31:59 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'm planning on removing imake from oe-core on the grounds that it's
2013, not 1993.  Is anyone aware of anything still using imake?  If
there are users then I'll send the recipes on to meta-oe, otherwise
they can just disappear.

Ross

