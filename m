Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B905D72615
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Dec 2014 12:31:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 28 Dec 2014 04:31:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,655,1413270000"; d="scan'208";a="661447977"
Received: from apulli-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.138])
	by orsmga002.jf.intel.com with ESMTP; 28 Dec 2014 04:31:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Dec 2014 12:31:57 +0000
Message-ID: <2843303.CPYcjsZDpv@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <6010322.On4bLv5MV8@peggleto-mobl5.ger.corp.intel.com>
References: <1859515.Hd60QW1tn7@peggleto-mobl5.ger.corp.intel.com>
	<6010322.On4bLv5MV8@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
Cc: yocto@yoctoproject.org
Subject: Re: [yocto] meta-java layer maintainership
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
X-List-Received-Date: Sun, 28 Dec 2014 12:32:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 01 December 2014 11:57:10 Paul Eggleton wrote:
> On Monday 01 December 2014 10:16:24 Paul Eggleton wrote:
> > Henning would like some folks to help him maintain the meta-java layer,
> > which contains OpenJDK and other open source Java-related components.
> > 
> > An ideal candidate maintainer would:
> >  * Have an interest in maintaining the Java-related recipes in the layer
> >  * Be willing to review and merge patches from the community
> > 
> > If you'd like to help out here (and responsibility can be shared by more
> > than one person, it doesn't just have to be one) then please reply here or
> > in private and I'll arrange for you to get access to the repository.
> 
> Looks like we now have enough people to take care of this, thanks everyone!

I'm not sure if this ever got announced, but we now have the following 
maintainers for meta-java:

  Henning Heinold <henning@itconsulting-heinold.de>
  Mario Domenech Goulart <mario@ossystems.com.br>
  Maxin John <maxin.john@enea.com>
  Otavio Salvador <otavio@ossystems.com.br>

At the same time, the layer has also been moved to the following location:

  http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/

I've just updated the OE layer index accordingly. Please update your local 
clones using something similar to the following command:

  git remote set-url origin git://git.yoctoproject.org/meta-java

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

