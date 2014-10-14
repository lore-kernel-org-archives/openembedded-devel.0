Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB4A6A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 19:11:36 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 655A22232027
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 21:11:35 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 597A52232026
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 21:11:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de (port-212-202-246-82.static.qsc.de
	[212.202.246.82]) by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 21:11:33 +0200 (CEST)
Date: Tue, 14 Oct 2014 21:11:23 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141014191111.GC12024@mail.itconsulting-heinold.de>
References: <1412942429-14728-1-git-send-email-cristian.iorga@intel.com>
MIME-Version: 1.0
In-Reply-To: <1412942429-14728-1-git-send-email-cristian.iorga@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH 0/2] meta-java fixes
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
X-List-Received-Date: Tue, 14 Oct 2014 19:11:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 10, 2014 at 03:00:27PM +0300, Cristian Iorga wrote:
> meta-java build time fixes with the pre 1.7 Yocto Project release.
> 
> Cristian Iorga (2):
>   openjdk: add pkgconfig support
>   ecj: fix unpackpost task
> 
>  recipes-core/ecj/libecj-bootstrap.inc   | 2 +-
>  recipes-core/openjdk/openjdk-common.inc | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

Hi,

thanks for the patches I have applied them for the dora branch, master is still building.

Bye Henning

