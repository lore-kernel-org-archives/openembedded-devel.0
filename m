Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1P0VRI-0002yJ-TC
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 10:21:29 +0200
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 0ABDA1B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Sep 2010 08:24:26 +0000 (UTC)
Message-ID: <4CA1A57B.4090706@freyther.de>
Date: Tue, 28 Sep 2010 16:21:15 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100921 Fedora/3.1.4-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285649277-7540-1-git-send-email-sgarman@zenlinux.com>
In-Reply-To: <1285649277-7540-1-git-send-email-sgarman@zenlinux.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] grep: update 2.6.3 to 2.7
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
X-List-Received-Date: Tue, 28 Sep 2010 08:21:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/28/2010 12:47 PM, Scott Garman wrote:
> Signed-off-by: Scott Garman <sgarman@zenlinux.com>
> ---
>  recipes/grep/grep-2.6.3/uclibc-fix.patch    |   50 ---------------------------
>  recipes/grep/grep-2.7/uclibc_libiconv.patch |   18 ++++++++++
>  recipes/grep/grep_2.6.3.bb                  |   45 ------------------------
>  recipes/grep/grep_2.7.bb                    |   42 ++++++++++++++++++++++
>  4 files changed, 60 insertions(+), 95 deletions(-)
>  delete mode 100644 recipes/grep/grep-2.6.3/uclibc-fix.patch
>  create mode 100644 recipes/grep/grep-2.7/uclibc_libiconv.patch
>  delete mode 100644 recipes/grep/grep_2.6.3.bb
>  create mode 100644 recipes/grep/grep_2.7.bb

Could you please regenerate with rename detection (man git-format-patch, man
git-diff)?


