Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QYjbO-0008TM-SD
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Jun 2011 20:53:39 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QYjXy-0001RA-UM from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Jun 2011 11:50:06 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 20 Jun 2011 11:50:06 -0700
Received: from [172.30.80.125] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Mon, 20 Jun 2011 11:50:05 -0700
Message-ID: <4DFF964A.8050801@mentor.com>
Date: Mon, 20 Jun 2011 11:49:46 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1308568797.5090.24.camel@mattotaupa>
In-Reply-To: <1308568797.5090.24.camel@mattotaupa>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 20 Jun 2011 18:50:06.0739 (UTC)
	FILETIME=[DF658630:01CC2F7A]
Subject: Re: libmailtools-perl_2.06: task fetch fails: source not available anymore
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
X-List-Received-Date: Mon, 20 Jun 2011 18:53:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/20/2011 04:19 AM, Paul Menzel wrote:
> Dear OE folks,
> 
> 
> could the source tarball `MailTools-2.06.tar.gz` please be put on the
> OpenEmbedded mirror, since it is not available anymore upstream [1]
> (only 2.07 and 2.08).

Is anything pinning this version?  Does it look like (assuming an
upstream changelog) there's big changes in .07 or .08?  It might really
be best to move to 2.08 (and do the same for meta-oe).

-- 
Tom Rini
Mentor Graphics Corporation


