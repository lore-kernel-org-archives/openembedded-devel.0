Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 40C7B6E9F6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 14:28:40 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id e16so25294224qcx.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 06:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Vq2+W+MEdSsArvvTNIYLCsZDZErRc3bWsNxPWF291wM=;
	b=xtMCaU6aMiaijut5PULpXx4wz5HFtEtJg2UlXAwCcC2rPNmhDMrWzjOShTDvHHH8dT
	GhdyOVqHNeguAQr0le4G5VytTW83cztwtyi5P8Pu0ophU0hzPMYqx0DSdIRDfY2X63Rd
	6i4OOvVyoblMawpLavS+CCUqNFG2TL5r+EP6ZM+CZgJtp5nsoLLhoS71E/omdXRAOG8F
	yY5cePf8HV72ON6rlk06Yro54Mxbm8BS3EujbttATvQwzP0v1tiEWm2DR5YabTZAQ3kf
	SzOY9Tt5jA/QUgno9hTSB7iaw9FkKZha+mF/PpEMKHNyO5izUgIUAvV3Ln55Rvnollxc
	XNLA==
X-Received: by 10.140.35.211 with SMTP id n77mr10050745qgn.82.1392733720436;
	Tue, 18 Feb 2014 06:28:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 18 Feb 2014 06:28:20 -0800 (PST)
In-Reply-To: <CAJTo0LYn3t67V_u=SA5KT0Ooj616SCHOUH-8qv+=TBONzrCptA@mail.gmail.com>
References: <1392731681-6149-1-git-send-email-diego.sueiro@gmail.com>
	<CAJTo0LYn3t67V_u=SA5KT0Ooj616SCHOUH-8qv+=TBONzrCptA@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 18 Feb 2014 11:28:20 -0300
Message-ID: <CAMCfZKEPS_2xstq+x_Tpi-PjAGyxChmJ+JnACgBL_euPtQYPSA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Tue, 18 Feb 2014 14:28:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

Ross,
On Tue, Feb 18, 2014 at 11:10 AM, Burton, Ross <ross.burton@intel.com>wrote:

> > +PACKAGECONFIG ?= ""
>
> Shouldn't that be "??=" ?
>

I've just followed Martin instructions:
http://lists.openembedded.org/pipermail/openembedded-devel/2014-February/094191.html


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

