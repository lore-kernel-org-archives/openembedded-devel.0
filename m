Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NR0ww-0001uE-5J
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 11:11:13 +0100
Received: from [85.210.22.104] (helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NR0uz-0005M9-6J
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 10:09:09 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1262424517-21966-1-git-send-email-camelguo@gmail.com>
References: <>  <1262424517-21966-1-git-send-email-camelguo@gmail.com>
Date: Sat, 02 Jan 2010 10:09:05 +0000
Message-ID: <1262426945.2553.70.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.22.104
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Add mips entry for linux-uclibc into package_qa_get_machine_dict of insane.bbclass
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
X-List-Received-Date: Sat, 02 Jan 2010 10:11:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2010-01-02 at 17:28 +0800, Guo Hongruan wrote:
> * Without it the insance check will fail due to key miss exception.
> 
> Signed-off-by: Guo Hongruan <camelguo@gmail.com>
> ---
>  classes/insane.bbclass |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Thanks for the patch.  I checked this in.

p.




