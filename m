Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OOma7-00061R-00 for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 08:58:39 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OOmVm-0003ML-Kj for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 08:54:10 +0200
Received: from 91.213.169.4 ([91.213.169.4])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 08:54:10 +0200
Received: from dbaryshkov by 91.213.169.4 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 08:54:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Wed, 16 Jun 2010 06:54:03 +0000 (UTC)
Message-ID: <hv9seb$ks1$1@dough.gmane.org>
References: <E1OOdAL-0005Tc-Dn@melo.openembedded.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 91.213.169.4
User-Agent: Pan/0.133 (House of Butterflies)
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_NUMERIC_HELO,SPF_HELO_PASS,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Khem Raj : gnu-config: Add recipe for git version.
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
X-List-Received-Date: Wed, 16 Jun 2010 06:58:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

git version control wrote:

> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 473cd5f616190739550abd8bf71629a87036730b URL:   
> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=473cd5f616190739550abd8bf71629a87036730b
> 
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Tue Jun 15 13:52:40 2010 -0700
> 
> gnu-config: Add recipe for git version.
> 
> * Rename gnu-config to files folder.
> 
> Signed-off-by: Khem Raj
> <raj.khem@gmail.com>

Unless I have git-native in ASSUME-PROVIDED, this breaks builds with:
ERROR: Unbuildable tasks were found.
These are usually caused by circular dependencies and any circular dependency chains found will be printed below. Increase the debug level to see a list of unbuildable tasks.


-- 
With best wishes
Dmitry




