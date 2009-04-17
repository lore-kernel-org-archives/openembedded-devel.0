Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LusDW-0000b9-Jy
	for openembedded-devel@openembedded.org; Fri, 17 Apr 2009 19:51:20 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lus9c-0001KM-B0
	for openembedded-devel@openembedded.org; Fri, 17 Apr 2009 17:47:08 +0000
Received: from cuo02-acns-ce1.cisco.com ([64.101.22.72])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 17 Apr 2009 17:47:08 +0000
Received: from msundius by cuo02-acns-ce1.cisco.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 17 Apr 2009 17:47:08 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Michael Sundius <msundius@sundius.com>
Date: Fri, 17 Apr 2009 17:46:56 +0000 (UTC)
Message-ID: <loom.20090417T174214-901@post.gmane.org>
References: <loom.20090417T162838-591@post.gmane.org>
	<49E8B372.1020908@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 64.101.22.72 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.15) Gecko/20080702 Fedora/2.0.0.15-1.fc8 Firefox/2.0.0.15)
Sender: news <news@ger.gmane.org>
Subject: Re: recipe "not available"
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
X-List-Received-Date: Fri, 17 Apr 2009 17:51:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Philip Balister <philip <at> balister.org> writes:

> 
> Michael Sundius wrote:
> > I've added a recipe for glibc to build the tools used by my company
> > for our set top box. It seems to be parsed by bitbake (since if I
> > intentionally add an erroneous line, bitbake will complain) however
> > when it gets time to run the tasks spelled out in the recipe, I get
> > the following errors, and a different version is used. 
> 
> Do you have an overlay in place? I've had similar maddening issues 
> editing recipes from .dev that were duplicated in an overlay.
> 
> Philip
> 
why yes, I have a local directory where I'm keeping my recipes. 

oddly enough this is the first recipe where I have a local one
that has the same name and version as one in the 
./openembedded/packages/glibc directory. 

I thought that there might be an issue where it was confused by
which file it should use. but I've since deleted the version
in the openembedded/packages/glibc directory. I've also 
removed the tmp directory... is there anything else I need to
clean out to make sure there are no conflicts?

how did you resolve your problems?

thanks
Mike




