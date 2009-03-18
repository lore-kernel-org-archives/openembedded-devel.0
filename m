Received: from [130.89.2.12] (helo=mx.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Ljy57-0002Q2-Jn
	for openembedded-devel@openembedded.org; Wed, 18 Mar 2009 16:53:30 +0100
Received: from Powerbook-3.local (vpn006012.vpn.utwente.nl [130.89.6.12])
	by mx.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id n2IFqQV8001684
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2009 16:52:27 +0100
Message-ID: <49C118BA.9020004@student.utwente.nl>
Date: Wed, 18 Mar 2009 16:52:26 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090225 Shredder/3.0b3pre
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <27612.658069893$1237390186@news.gmane.org>
In-Reply-To: <27612.658069893$1237390186@news.gmane.org>
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-SA-Exim-Connect-IP: 130.89.2.12
X-SA-Exim-Mail-From: k.kooi@student.utwente.nl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,RDNS_NONE autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Loss of all package history following the recipe rename.
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
X-List-Received-Date: Wed, 18 Mar 2009 15:53:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-03-09 16:23, John Willis wrote:

> That said, 'git-filter-branch' is a little scary

We can't run that anymore on OE, since git changed the behaviour of the 
crud() function since we migrated and will change author names (no 
trailing '.' allowed anymore).

regards,

Koen


