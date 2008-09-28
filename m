Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Kjkgy-0007V0-N1
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Sep 2008 03:03:20 +0200
Received: from [92.117.146.220] (helo=[10.161.146.220])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KjkdD-0005b0-Sn
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Sep 2008 02:59:28 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Sep 2008 02:59:18 +0200
User-Agent: KMail/1.9.9
References: <200809272237.22810.zecke@selfish.org> <48DEA994.2030607@gmx.de>
	<48DEAE43.5090407@balister.org>
In-Reply-To: <48DEAE43.5090407@balister.org>
MIME-Version: 1.0
Message-Id: <200809280259.18588.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.117.146.220
Subject: Re: git conversion and what is missing?
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
X-List-Received-Date: Sun, 28 Sep 2008 01:03:20 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday 28 September 2008 00:05:55 Philip Balister wrote:

> I think the table is needed to properly fill out some of the commit
> messages during the conversion.
>
> Holger, I am right about this?

Yes, you are. In git land the author has a name and mail address. People will 
try to send email to the mail address so it should be correct. The other part 
is there should be a name otherwise stuff like git-commit -c SHA1 will fail.

I like Otavio's idea with the deadline. The question is what to do with 
unknown names (coming from people using --author on mtn ci). Should we use 
the comitter id and put the name from mtn inside the comment?


z.


