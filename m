Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1U6Jzm-0000BO-IK
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2013 13:02:33 +0100
Message-ID: <511E200D.3000907@communistcode.co.uk>
Date: Fri, 15 Feb 2013 11:46:21 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130109 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAKSKmM3AKfssEKaJ6ndb5v9On73Yi6WW9b99h6biHtD=8xS6Aw@mail.gmail.com>
	<511CAFF3.3090004@communistcode.co.uk>
	<CAKSKmM3vHzj_-Jh1MP1SZxxsCYe212NdnWApHvmn6CVJPXOMsA@mail.gmail.com>
	<511CB7DD.4080407@communistcode.co.uk>
	<CAKSKmM3keR3GKfvT5_VFvL101RBjbwfS4=ugV=yodWfBRfzs4w@mail.gmail.com>
	<CAJTo0LbBSzhFyghuTRrbeb5bpL4oB7DO=2i3GMc_CTtpxTzq2g@mail.gmail.com>
	<CAKSKmM2NNdci6kCtaxnWDgApkFerkTDYFGy78-XddG9N8xqBGw@mail.gmail.com>
	<CAJTo0LaESjBTOXzxQzQm5KxkQqOi8HnKgJxxjr99mNWTbbeVog@mail.gmail.com>
	<CAKSKmM2bC1C65ca2RZcKvz3yTEM_9+yHFq95yMD+hJPWpYziCA@mail.gmail.com>
	<CAJTo0LayOQb60HB--SWiWBYau=ECryZx7Kn_QD21-G8kEMZiog@mail.gmail.com>
In-Reply-To: <CAJTo0LayOQb60HB--SWiWBYau=ECryZx7Kn_QD21-G8kEMZiog@mail.gmail.com>
Subject: Re: gtk errors in openembedded classis build
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
X-List-Received-Date: Fri, 15 Feb 2013 12:02:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 15/02/13 11:31, Burton, Ross wrote:
> On 15 February 2013 10:50, Sankar H Malarmani <sankar.m@hardcube.in> wrote:
>> /home/hc/oe-core/build/../stuff/openembedded-core/meta/recipes-connectivity/wpa-supplicant/
>> wpa-supplicant_2.0.bb inherits systemd but doesn't set SYSTEMD_PACKAGES
> That error message describes the problem quite well.  You appear to be
> mixing very recent oe-core with an older meta-systemd, which won't
> work as they are both undergoing heavy systemd changes at the moment.
> If you update both at the same time you might get something that
> works.
>
> Welcome to the joy of building against git master of multiple
> repositories - things break.  Unless you're capable of fixing the
> problems as you find them it's recommended to use the stable releases
> instead of git master.

Or as I mentioned above, use the git commits that the meta-toradex wiki 
pages recommends.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



