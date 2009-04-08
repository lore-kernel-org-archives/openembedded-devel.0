Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LrcsK-0007dQ-4l
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 20:51:57 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHS0095TPKV7FKU@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	08 Apr 2009 13:48:39 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A8F286B83B5; Wed,
	08 Apr 2009 14:48:31 -0400 (EDT)
Date: Wed, 08 Apr 2009 14:48:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090408184831.GC14502@denix.org>
References: <1239209556-847-1-git-send-email-clarson@mvista.com>
	<1239209556-847-2-git-send-email-clarson@mvista.com>
	<87ljqb12o3.fsf@neumann.lab.ossystems.com.br>
MIME-version: 1.0
In-reply-to: <87ljqb12o3.fsf@neumann.lab.ossystems.com.br>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=AWL,BAYES_50,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Shorten some full paths printed to the user.
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
X-List-Received-Date: Wed, 08 Apr 2009 18:51:57 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 08, 2009 at 02:22:04PM -0300, Otavio Salvador wrote:
> Chris Larson <clarson@mvista.com> writes:
> 
> > Adds a base_path_out convenience function, which prepares a full path for
> > display to the user.  The initial implementation just makes it relative to
> > ${TOPDIR}.  This function is then used for some messages outputted to the
> > user (packaged-staging, patch application, clean, unpack tasks).
> >
> > Signed-off-by: Chris Larson <clarson@mvista.com>
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Yeah, I like the second patch! Not sure about the first one - I personally do 
have filters on the output messages to highlight and/or notify me about what's 
going on with the build.

-- 
Denys


