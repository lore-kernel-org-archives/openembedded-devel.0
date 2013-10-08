Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by mail.openembedded.org (Postfix) with ESMTP id 66CE56A441
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 04:37:53 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUC00AYP276LC00@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	07 Oct 2013 23:37:55 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3592E20179; Tue,
	08 Oct 2013 00:37:53 -0400 (EDT)
Date: Tue, 08 Oct 2013 00:37:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Trevor Woerner <trevor.woerner@linaro.org>
Message-id: <20131008043753.GN18775@denix.org>
References: <CALmOhgkzmnVuviF+cAzELRpdZomHDzpHn5-1dZEwa_xznG8JiQ@mail.gmail.com>
	<20131004141433.GG6240@jama>
	<CALmOhgnnSusbb0OPO32TN9C8xQRmqMmW+ZDoEq7d2870JoQfRw@mail.gmail.com>
	<20131004173934.GL6240@jama> <20131007175336.GB18775@denix.org>
	<CALmOhgmujUDrb512ffgHZ1+Ep8ZLPsamBOdfnA8rKvrXB3r2+A@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CALmOhgmujUDrb512ffgHZ1+Ep8ZLPsamBOdfnA8rKvrXB3r2+A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Abhijit Potnis <abhijit_potnis@mentor.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: meta-qt5, master, qtwebkit-examples build failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Oct 2013 04:37:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Oct 08, 2013 at 12:28:06AM -0400, Trevor Woerner wrote:
> On 7 October 2013 13:53, Denys Dmytriyenko <denis@denix.org> wrote:
> > FYI, besides the obvious ICU requirement, qtwebkit-examples was not actually
> > building any examples for me, so I had to bbappend the recipe w/ a tiny patch:
> >
> > http://arago-project.org/pipermail/meta-arago/2013-October/002107.html
> 
> 
> :-)
> 
> I had noticed that issue as well. Any chance this could get merged upstream?
> 
> It's a bit unfortunate you need to add "qtwebkit-examples-examples" to
> your IMAGE in order to actually get the examples into your image,
> instead of just "qtwebkit-examples".

I just submitted a patch, but forgot the [meta-qt5] prefix:

http://lists.openembedded.org/pipermail/openembedded-devel/2013-October/092499.html

-- 
Denys

