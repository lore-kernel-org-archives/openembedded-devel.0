Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JXFTh-0002mJ-Dg
	for openembedded-devel@openembedded.org; Thu, 06 Mar 2008 13:45:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m26Ci8D5002004
	for <openembedded-devel@openembedded.org>; Thu, 6 Mar 2008 12:44:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01624-09 for <openembedded-devel@openembedded.org>;
	Thu,  6 Mar 2008 12:44:04 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m26ChxaI001997
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 6 Mar 2008 12:43:59 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <47CD1118.4090103@student.utwente.nl>
References: <fpmn1u$53v$1@ger.gmane.org>	<fqhsvd$mdm$1@ger.gmane.org>
	<fqi1q5$77t$1@ger.gmane.org>	<fqi970$rdg$1@ger.gmane.org>
	<fqiah1$uja$1@ger.gmane.org>  <47CD1118.4090103@student.utwente.nl>
Date: Thu, 06 Mar 2008 12:43:59 +0000
Message-Id: <1204807439.8034.3.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: autobuilds and bug tracker
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Mar 2008 12:46:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-03-04 at 10:06 +0100, Koen Kooi wrote:
> Rolf Leggewie schreef:
> | Rolf Leggewie wrote:
> |> Furthermore, I don't see why the changes in question would need any
> |> changes to bugzilla itself.
> |
> | From what I can gather, only seppuku.bbclass would have to be altered.
> | http://oz.leggewie.org/wip/seppuku.diff.txt may or may not achieve the
> | result I proposed.
> |
> | So let me ask again why you need an escalation of privileges before you
> | can proceed.
> 
> Well, that's a failry long list, but let me start with:
> 
> * managing default values for bugs (e.g. build/distro, distro, priority,
> etc)
> * adding extra fields for the autobuilder to fill in
> * Fixing charset conversion due to our utf8 migration not being complete
> 
> and finally, the most important one: tweaking xmlrpc params so we can
> stop screenscraping of bugzilla.

Hopefully we can review the whole bugzilla permissions situation once it
moves to a new host.

Cheers,

Richard



