Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id C8C97764AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 01:48:25 +0000 (UTC)
Received: by igk11 with SMTP id 11so23163817igk.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Aug 2015 18:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=GtFrNANbf3J02eqamDTRlXY7Gmx7aUYSZP70vLbhSOE=;
	b=RH3obvnXdEWwjZEVR78er41px8ePflnO6xHgTSnBqi6EdzjSLXB5A/vXqRC8oNwOwX
	uGkhhrAH313BSC7LP8EpuJctaRco1ehCPnTDZjQ8mlM49dHyIK5G1/jWU/qVdCNWKnyz
	dIPhx5X8Rq9b0bt0DNyAKVqYAKQxpUkYaE611AsRjqy81v5OGNr+mi2Uxervx5L980M1
	u8Hoko6BcbvSusLT2p119cHxiab7QFu3RiVIJ2I1Q9K/2iLJx4a5y4byOTdaxZXsRIy3
	0iVdXyG/orupd3t8zmcI3g15V/NulgHOewZ7lYN/c7hlYlkQRTy8xpf4eCMQ8plQ4eTw
	lbTw==
X-Received: by 10.50.30.196 with SMTP id u4mr834083igh.11.1438912105389; Thu,
	06 Aug 2015 18:48:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Thu, 6 Aug 2015 18:47:56 -0700 (PDT)
In-Reply-To: <B399646F8CA055479BEC55F6B065A04A3703F105@FMSMSX108.amr.corp.intel.com>
References: <B399646F8CA055479BEC55F6B065A04A3703F105@FMSMSX108.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Aug 2015 18:47:56 -0700
Message-ID: <CAMKF1soC4=mMLfhgSXEhd318AiHuAj+YF+otJ6fGtgE4+jy7gw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"mario@ossystems.com.br" <mario@ossystems.com.br>
Subject: Re: [meta-java] [Enabling-Openjdk-8-for-x86-hotspot-vm-and-arm-zero-vm]
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
X-List-Received-Date: Fri, 07 Aug 2015 01:48:26 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 6, 2015 at 6:31 PM, Awasthi, Vinay K
<vinay.k.awasthi@intel.com> wrote:
> This patch enables zero VM for arm. It is tested on openembedded-core. This
> patch compiles are components for arm including NASHORN (java script over java)

why zerovm, why not hotspot for arm as well ?

