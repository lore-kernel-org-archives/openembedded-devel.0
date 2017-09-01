Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 34D6B7847C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 11:08:59 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 01 Sep 2017 04:09:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,457,1498546800"; d="scan'208";a="1009979556"
Received: from kcheng8-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.81])
	by orsmga003.jf.intel.com with ESMTP; 01 Sep 2017 04:08:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Galbusera <gizero@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 01 Sep 2017 23:08:53 +1200
Message-ID: <1878611.57GleFT2nc@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CAC+thW1YCXd-RGakNnfx-j8z3W0Cq9wwTORWNzv9bt=7VKSC2w@mail.gmail.com>
References: <cover.1504238509.git.paul.eggleton@linux.intel.com>
	<C8465E87-50F5-4857-8835-3B8D7D25D6C8@linux.intel.com>
	<CAC+thW1YCXd-RGakNnfx-j8z3W0Cq9wwTORWNzv9bt=7VKSC2w@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 0/2] Add a couple of MQTT support recipes
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
X-List-Received-Date: Fri, 01 Sep 2017 11:09:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 1 September 2017 6:03:52 PM NZST Andrea Galbusera wrote:
> On Fri, Sep 1, 2017 at 6:44 AM, Tim Orling <timothy.t.orling@linux.intel.com
> > wrote:
> > > On Aug 31, 2017, at 9:02 PM, Paul Eggleton <
> > paul.eggleton@linux.intel.com> wrote:
> > >
> > > Add a couple of recipes from meta-intel-iot-middleware to support MQTT.
> > > Since the meta-intel-iot-middleware layer isn't being actively
> > > maintained and these aren't in any way Intel-specific I figured they
> > > ought to be brought up-to-date and moved somewhere that people can more
> > > easily reuse them.
> > >
> >
> > Thank you for this. It has been a concern of mine and this is a welcome
> > solution.
> 
> 
> Good news for me also! FWIW months ago there used to be a more recent
> version of meta-intel-iot-middleware hosted on github as part of Ostro.
> Since this was confusing to me I asked [1] on the list to clarify
> maintenance status and relationships between the two things, but only got a
> reply [2] from a former maintainer of the repo on yoctoproject.org. Anyway
> I agree that having MQTT recipes in meta-oe will help! Thanks Paul for
> that!
> 
> [1]
> https://lists.yoctoproject.org/pipermail/meta-intel/2016-December/
004462.html
> [2]
> https://lists.yoctoproject.org/pipermail/meta-intel/2017-January/004488.html

No worries. I see you were after these two recipes and hiredis (and the latter 
is in meta-oe now as you probably know).

The recipes that aren't either obsolete or available elsewhere are as follows:

hid-api
libstrophe
libwyliodrin
mdns
python-pyfirmata
sshpass
tempered
wyliodrin-server

Only python-pyfirmata looks particularly interesting to me, but if there are 
others that anyone would like preserved/updated please let me know.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

