Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NZBV4-00005J-HA
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 00:04:13 +0100
Received: (qmail 18951 invoked by uid 1003); 24 Jan 2010 23:01:49 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 24 Jan 2010 23:01:49 -0000
Message-ID: <4B5CD15C.3090107@balister.org>
Date: Sun, 24 Jan 2010 18:01:48 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1264331348.3810.51.camel@mattotaupa>
In-Reply-To: <1264331348.3810.51.camel@mattotaupa>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Signed-off-by, Reviewed-by, Acked-by by person reviewing committing a patch.
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
X-List-Received-Date: Sun, 24 Jan 2010 23:04:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/24/2010 06:09 AM, Paul Menzel wrote:
> Dear OE users,
>
>
> Holger is doing great work going through unreviewed and unapplied
> patches.
>
> Could the committer please add his Signed-off-by-line to the commit
> message. I guess you can tweak `git log` to print out the committer too
> – Gitk is displaying it. –, but I guess using `git am -s` should do the
> trick equally.

the script in contrib/patchwork does this for you also :)

Philip


