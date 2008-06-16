Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K8FjQ-0005JW-Sn
	for openembedded-devel@openembedded.org; Mon, 16 Jun 2008 16:30:53 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K8Fil-0007bU-UE
	for openembedded-devel@openembedded.org; Mon, 16 Jun 2008 14:30:11 +0000
Received: from ip-62-143-23-251.hsi.ish.de ([62.143.23.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 16 Jun 2008 14:30:11 +0000
Received: from no2spam by ip-62-143-23-251.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 16 Jun 2008 14:30:11 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Mon, 16 Jun 2008 16:30:06 +0200
Message-ID: <g35tdc$upb$1@ger.gmane.org>
References: <1213345201.13942.3.camel@dax.rpnet.com>	<g2ubb9$a55$1@ger.gmane.org>	<87od65rxi8.fsf@neumann.lab.ossystems.com.br>	<200806132137.51103.zecke@selfish.org>	<87mylpqccr.fsf@neumann.lab.ossystems.com.br>	<g35hnj$k46$1@ger.gmane.org>
	<87zlplldul.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-23-251.hsi.ish.de
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
In-Reply-To: <87zlplldul.fsf@neumann.lab.ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 16 Jun 2008 14:30:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Otavio Salvador wrote:
>  - the tree will be a moving target, without stable revision numbers
>    and difficult to merge, base work in and like

OE is always a moving target.  I don't see how the policy would change that.

>  - most of the pros can be done using the oe-next tree. Doing a full
>    compilation of changed modules before and after each merge gives a
>    nice feedback for trivial problems

Modules?  Are you talking kernel?  Or are you using modules as a synonym
for recipe?

>  - Being available on unstable doesn't mean it'll be tested

Neither does any of the other proposals ensure that.  "tested" sounds
like 0 or 1, but in fact it is a continuum.  I can at least think of the
following

- compiles fine
- compiles fine from scratch
- compiles fine from scratch for MACHINE/DISTRO X and Y
- tested to run on MACHINE X
- tested to run on all supported MACHINEs
- does not interfere with another package

What do you mean by "tested"?  How will other processes and policies
ensure that?

>  - 2 days is a too short testing window

well, that is of course just a proposal and thus easy to fix if necessary.

PS: This is not a rebuttal or a claim that the proposed policy is even a
desirable one.  But I feel there is more need for clarification.



