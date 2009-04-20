Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LvwWf-0006re-Is
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 18:39:21 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LvwSU-0004jf-GP
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 16:35:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 16:35:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 16:35:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 20 Apr 2009 18:32:52 +0200
Message-ID: <gsi83l$ec5$2@ger.gmane.org>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1240241104-21935-3-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1240241104-21935-3-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 1/1] tracker: added libgnomecanvas to dependencies
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
X-List-Received-Date: Mon, 20 Apr 2009 16:39:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Koen Kooi <koen@openembedded.org>


On 20-04-09 17:24, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz<hrw@openembedded.org>
>
> ---
>   recipes/tracker/tracker_0.5.4.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/tracker/tracker_0.5.4.bb b/recipes/tracker/tracker_0.5.4.bb
> index 4753280..e1a94b7 100644
> --- a/recipes/tracker/tracker_0.5.4.bb
> +++ b/recipes/tracker/tracker_0.5.4.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "Tracker is a tool designed to extract information and metadata about your personal data so that it can be searched easily and quickly."
>   LICENSE = "GPLv2"
> -DEPENDS = "file gtk+ gstreamer gamin libgmime dbus poppler libexif libgsf"
> +DEPENDS = "file gtk+ gstreamer gamin libgmime dbus poppler libexif libgsf libgnomecanvas"
>
>   PR = "r3"
>




