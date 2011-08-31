Received: from mail2.multitech.net ([65.126.90.254] helo=mail2.multitech.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jgilles@multitech.com>) id 1QyloN-0004Xj-Ol
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 16:30:39 +0200
Received: from mail2.multitech.com (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id
	516E35981F6_E5E4468B for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 14:25:44 +0000 (GMT)
Received: from mail.multitech.com (unknown [192.168.11.244])
	by mail2.multitech.com (Sophos Email Appliance) with ESMTP id
	1024D598013_E5E4468F for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 14:25:44 +0000 (GMT)
X-Ninja-PIM: Scanned by Ninja
X-Ninja-AttachmentFiltering: (no action)
Received: from [192.168.52.113] ([192.168.52.113]) by mail.multitech.com with
	Microsoft SMTPSVC(5.0.2195.7381); Wed, 31 Aug 2011 09:24:51 -0500
From: Jesse Gilles <jgilles@multitech.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4E5DDBBE.4050007@dresearch-fe.de>
References: <4E4E536D.7010103@dresearch-fe.de>
	<4E4E738C.70109@dresearch-fe.de> <4E5356B2.3060908@dresearch-fe.de>
	<4E53583A.3030405@gmx.net> <4E535B83.9080508@dresearch-fe.de>
	<CAFu+nvEh9tUGzQM1PFo1ErtOq+a+0yg94pZBO6Ohr92GNZoKBg@mail.gmail.com>
	<1314199372.21496.12.camel@jjg-linux>
	<4E562AFF.7090004@dresearch-fe.de>
	<4E56579C.7080207@dresearch-fe.de> <4E5CC094.2020500@dresearch-fe.de>
	<1314707457.3796.19.camel@mattotaupa>
	<4E5DDBBE.4050007@dresearch-fe.de>
Date: Wed, 31 Aug 2011 09:25:41 -0500
Message-ID: <1314800741.17073.7.camel@jjg-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-OriginalArrivalTime: 31 Aug 2011 14:24:51.0475 (UTC)
	FILETIME=[BEE6F630:01CC67E9]
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [2011.03-maintenance] do_compile failed for cacao_0.99.3.bb
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
X-List-Received-Date: Wed, 31 Aug 2011 14:30:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-31 at 08:59 +0200, Steffen Sledz wrote:
> Mea culpa. I should have asked the contributor to resend the patch
> with a policy conforming comment. Sorry.
> 
> Do we still have a chance to change the comment if the patch was
> already pushed?
> 
> Steffen

Yes, sorry about this, I wasn't aware that discussing a patch on the
list and having it in the body of an email would automatically pull it
into patchwork when I did it.  I didn't really intend for it to get
committed as-is (comments-wise anyway) since I was more trying to
discuss the patch rather than submit it with proper comments, etc.

Thanks Steffen for taking initiative though :)

I don't think you can change the comment once it is in the shared OE
repo (and therefore in repos on other peoples machines).  You could
revert it and resubmit with a better comment though.  Please correct me
if I'm wrong on this...

Jesse



