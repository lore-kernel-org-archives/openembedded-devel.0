Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id C9F96734DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Aug 2015 14:47:32 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Thu, 6 Aug 2015
	16:47:30 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 66A4528BA20;
	Thu,  6 Aug 2015 16:47:30 +0200 (CEST)
Date: Thu, 6 Aug 2015 16:47:30 +0200
From: "Maxin B. John" <maxin.john@enea.com>
To: "Awasthi, Vinay K" <vinay.k.awasthi@intel.com>
Message-ID: <20150806144729.GA20394@sestofb10.enea.se>
References: <B399646F8CA055479BEC55F6B065A04A3703DA8B@FMSMSX108.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <B399646F8CA055479BEC55F6B065A04A3703DA8B@FMSMSX108.amr.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"'otavio@ossystems.com.br'" <otavio@ossystems.com.br>,
	"'mario@ossystems.com.br'" <mario@ossystems.com.br>
Subject: Re: [meta-java] [Openjdk-8 enabling patch]
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
X-List-Received-Date: Thu, 06 Aug 2015 14:47:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

On Wed, Aug 05, 2015 at 07:29:00PM +0000, Awasthi, Vinay K wrote:
> diff --git recipes-core/openjdk/openjdk-8-8u40b27/cacao-arm-ucontext.patch
> 
> +        return "LIBFFI_LIBS=-lffi"
> 
> +    else:
> 
> +        return ""
>

Agree with Otavio and Paul here. Please re-do the patch as described
in the README with a reasonable commit message and we will be happy to
review it :)

Best Regards,
Maxin

