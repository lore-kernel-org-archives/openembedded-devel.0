Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MEN9a-0006mU-PV
	for openembedded-devel@openembedded.org; Wed, 10 Jun 2009 14:43:43 +0200
Received: (qmail 24858 invoked from network); 10 Jun 2009 12:33:50 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 10 Jun 2009 05:33:50 -0700
Date: Wed, 10 Jun 2009 05:33:50 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090610123349.GT26065@smtp.west.cox.net>
References: <h0nft3$jso$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <h0nft3$jso$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: deduce git revision from mtn revision
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Jun 2009 12:43:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 10, 2009 at 02:21:37PM +0900, Rolf Leggewie wrote:

> Hi,
>
> is there any way to know which git revision corresponds to mtn commit  
> 53dccbcb3344fa9a96f7f2c544d3dfec1b100fca?  I guess googling for the  
> revision and then using git log can eventually yield that info. Anything 
> simpler and more straight-forward?

I used mtn to find the whole commit, copy the commit message info and
then search for that commit message in git.

-- 
Tom Rini


