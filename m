Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1P7QIK-0006oI-R6
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 12:16:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id D4974A51D1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 11:16:17 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id p1fbtNYa1RAL
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 11:16:16 +0100 (BST)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 9059CA4828
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 11:16:16 +0100 (BST)
Message-ID: <4CBACCF1.1020403@xora.org.uk>
Date: Sun, 17 Oct 2010 11:16:17 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.9) Gecko/20100915 Lightning/1.0b2 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikvPnJupAjwCps+3Zc73jVNyd7Mm-X1PP307a-D@mail.gmail.com>
In-Reply-To: <AANLkTikvPnJupAjwCps+3Zc73jVNyd7Mm-X1PP307a-D@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: LICENSE, LICENSE and LICENSE
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
X-List-Received-Date: Sun, 17 Oct 2010 10:16:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

 On 16/10/2010 20:15, Frans Meulenbroeks wrote:
> Dear all,
>
> Being bored while waiting for a build to finish, I decided to to a
> grep for LICENSE on recipes/*/*
>
> As already reported on an earlier email about 375 recipes have no
> LICENSE (according to recipe_sanity).
>
> After a little bit of editing and sorting I came to the list at the
> end of this email.
> First digit is the number a license occurs, 2nd field is the license itself.
>
First thoughts in this is we need to standardise on names of licenses.
And for licenses that cannot be named like my personal favourite the
aspell-en recipe some way to indicate a "special" license and furthur
metadata about that license.

Graeme



