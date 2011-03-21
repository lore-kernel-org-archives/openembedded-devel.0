Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q1fed-0002Zk-VE
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Mar 2011 15:00:22 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q1fcv-0006vj-9G
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Mar 2011 14:58:33 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201103211333.17729.pgsellmann@portner-elektronik.at>
References: <201103171154.23397.pgsellmann@portner-elektronik.at>
	<201103211236.39719.pgsellmann@portner-elektronik.at>
	<1300708482.2228.67.camel@phil-desktop>
	<201103211333.17729.pgsellmann@portner-elektronik.at>
Date: Mon, 21 Mar 2011 13:58:35 +0000
Message-ID: <1300715915.2228.68.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 3/3] base-files-3.0.14 configuration files
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
X-List-Received-Date: Mon, 21 Mar 2011 14:00:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-21 at 13:33 +0100, Peter Gsellmann wrote:
> Would this work for you?
> CONFFILES_${PN}_micro = "${sysconfdir}/hostname ${sysconfdir}/nsswitch.conf"
> 
> Even if nothing on your target is honoring the configness of these files at least it is documented.

Yes, that sounds OK to me.

p.




