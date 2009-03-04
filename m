Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1LexmC-0003f5-Hk
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 21:33:12 +0100
Received: (qmail 22132 invoked by uid 813007); 4 Mar 2009 20:28:58 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 20:28:58 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 4 Mar 2009 21:28:50 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc6-00216-g778ef1e; KDE/4.2.0; x86_64; ;
	)
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
	<1236182004-4523-3-git-send-email-openembedded@haerwu.biz>
	<20090304191751.GV26343@smtp.west.cox.net>
In-Reply-To: <20090304191751.GV26343@smtp.west.cox.net>
MIME-Version: 1.0
Message-Id: <200903042128.51342.openembedded@haerwu.biz>
Subject: Re: [PATCH 02/70] rpm/rpm-native: Add recipe for 4.4.2.3 (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 20:33:12 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 04 of March 2009 20:17:51 Tom Rini wrote:

> rpm-native's configure depends on 'ed' being on the host.  We don't
> currently check for this in sanity.bbclass nor have an ed-native
> package which can be added to DEPENDS.

fixed

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




