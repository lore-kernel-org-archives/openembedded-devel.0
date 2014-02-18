Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 229916E8E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 14:10:49 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id c9so25380589qcz.41
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 06:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=Qiq2/nY9vwVkVMcn8Dvg38uLCU0x9zQE46y85cD/nqc=;
	b=PJLF274/H4tbccJFCKJaQvNOTmGdCIxit1eSpjF+Kx3oJNEDFy5/OJjGM2zLwVwNql
	h9QqVcmzLiApJVZF6bxBDQP0Edu6fE+euKIeuaDo0LH57KFPAozfquTag0ZCfO+1w0ez
	474YARKqe/By6xPPiN5WI/BBm7Y7KRzBZRg5eaF6nzqq2Hc31r6M3bWsWbr6eOEv7XgX
	d3IaECRBuYyj3//Hga3aWdUc/ehrwFw2RnwbgbOUh17OmBj14BzLI8umWMsTH6W7QTBz
	s7AEGUj/7ErTyDE/GacBGvGyoxbK6q6wgI9nZKsBeuFx0NJrUGvvsESGxSL6OfYZ0L8+
	Sicw==
X-Gm-Message-State: ALoCoQkTBRQrr97m60A6/za8aM2XDnCgxkrXUy5x3ztdUFpoiaAXxVX+bnikNPWUxBwv3x/Z0Ziz
X-Received: by 10.224.45.197 with SMTP id g5mr43192316qaf.52.1392732649421;
	Tue, 18 Feb 2014 06:10:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Tue, 18 Feb 2014 06:10:29 -0800 (PST)
In-Reply-To: <1392731681-6149-1-git-send-email-diego.sueiro@gmail.com>
References: <1392731681-6149-1-git-send-email-diego.sueiro@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Feb 2014 14:10:29 +0000
Message-ID: <CAJTo0LYn3t67V_u=SA5KT0Ooj616SCHOUH-8qv+=TBONzrCptA@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded][PATCH] libao: Add PACKAGECONFIG for esound support
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
X-List-Received-Date: Tue, 18 Feb 2014 14:10:50 -0000
Content-Type: text/plain; charset=UTF-8

On 18 February 2014 13:54, Diego Sueiro <diego.sueiro@gmail.com> wrote:
> +PACKAGECONFIG ?= ""

Shouldn't that be "??=" ?

Ross

