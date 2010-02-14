Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NgeXl-0005uo-5w
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 14:29:52 +0100
Received: from p5b0352a9.dip.t-dialin.net ([91.3.82.169] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Nge9B-000582-42 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2010 14:04:34 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1Nge9A-0003Lv-RM
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 14:04:24 +0100
Date: Sun, 14 Feb 2010 14:04:24 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100214130424.GC5979@excalibur.local>
References: <1266144202-5360-1-git-send-email-ospite@studenti.unina.it>
MIME-Version: 1.0
In-Reply-To: <1266144202-5360-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Update tzdata_2009s to tzdata_2009u
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
X-List-Received-Date: Sun, 14 Feb 2010 13:29:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sun, 2010-02-14 at 11:43, Antonio Ospite wrote:
> The archive for tzdata_2009s is not available at $SRC_URI anymore.
> 
> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> ---
>  .../tzdata/{tzdata_2009s.bb => tzdata_2009u.bb}    |    0
>  1 files changed, 0 insertions(+), 0 deletions(-)
>  rename recipes/tzdata/{tzdata_2009s.bb => tzdata_2009u.bb} (100%)
> 
> diff --git a/recipes/tzdata/tzdata_2009s.bb b/recipes/tzdata/tzdata_2009u.bb
> similarity index 100%
> rename from recipes/tzdata/tzdata_2009s.bb
> rename to recipes/tzdata/tzdata_2009u.bb

I just tested it and it fetched fine here. Anyway I added the newest version of
tzdata, 2010b, now to the repo. Thanks.

regards
Stefan Schmidt


