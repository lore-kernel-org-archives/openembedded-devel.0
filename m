Received: from [64.233.184.235] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1HMpc7-0007vW-2F
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Mar 2007 19:02:47 +0100
Received: by wr-out-0506.google.com with SMTP id i21so792268wra
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2007 10:02:46 -0800 (PST)
Received: by 10.115.17.1 with SMTP id u1mr74337wai.1172772162138;
	Thu, 01 Mar 2007 10:02:42 -0800 (PST)
Received: by 10.115.91.10 with HTTP; Thu, 1 Mar 2007 10:02:42 -0800 (PST)
Message-ID: <432beae0703011002t7c31c646g15bc2344e28ee68c@mail.gmail.com>
Date: Thu, 1 Mar 2007 10:02:42 -0800
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [oe-commits] org.oe.dev rootfs_ipk.bbclass: Implements a sensational new feature called 'oe-feed' which, for the first time ever, actually lets you use your ipk deploy dir as a feed in ipkg.conf./mtcommit ../classes/rootfs_ipk.bbclass Oh wai
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2007 18:02:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 3/1/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> coredump2 commit schreef:
> > rootfs_ipk.bbclass: Implements a  sensational new feature called 'oe-feed' which
>
> OEs feed management tools were removed a few years ago since it was decided that feed
> management was out of scope. That still holds.

The deploy/ipk directory has always been usable as a feed previously.
This is, of course, *how images are made*.

-- 
Justin Patrin


