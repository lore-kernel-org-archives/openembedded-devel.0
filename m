Received: from mail.multitech.net ([65.126.90.254] helo=mail2.multitech.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jgilles@multitech.com>) id 1R6Rzg-00027u-02
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 20:58:04 +0200
Received: from mail2.multitech.com (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id
	46930635764_E7A327CB for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2011 18:52:44 +0000 (GMT)
Received: from SVMVVWPEXCH01.dc.multitech.prv (unknown [192.168.11.104])
	by mail2.multitech.com (Sophos Email Appliance) with ESMTP id
	1EFDA635761_E7A327CF for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2011 18:52:44 +0000 (GMT)
Received: from [192.168.52.113] ([192.168.52.113]) by
	SVMVVWPEXCH01.dc.multitech.prv with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 21 Sep 2011 13:52:34 -0500
From: Jesse Gilles <jgilles@multitech.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CA+M6bXnpR1x0PRL7Pxgoo4sHxzvLgBGMP9D2rESp3g244xCsxQ@mail.gmail.com>
References: <1312821482-32319-1-git-send-email-jgilles@multitech.com>
	<1312827980.683.6.camel@jjg-linux>
	<CA+M6bXnpR1x0PRL7Pxgoo4sHxzvLgBGMP9D2rESp3g244xCsxQ@mail.gmail.com>
Date: Wed, 21 Sep 2011 13:52:43 -0500
Message-ID: <1316631163.6038.5.camel@jjg-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-OriginalArrivalTime: 21 Sep 2011 18:52:34.0955 (UTC)
	FILETIME=[A0283DB0:01CC788F]
Subject: Re: [PATCH] jakarta-libs: fix SRC_URIs for avalon-framework, logkit
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
X-List-Received-Date: Wed, 21 Sep 2011 18:58:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-08 at 20:02 -0700, Tom Rini wrote:
> I don't object to the change but it (a) needs to be in oe.dev (or
> oe-core/meta-oe) first and then (b) please send a pull request or git
> send-email of your cherry-pick.  Thanks!

Anyone with rights care to apply this to master so it can subsequently
go into 2011.03-maintenance?  I understand that most development is
going on in oe-core and meta-oe, but I don't think any of the recipes
needed to build OpenJDK are moved over yet, correct?

Thanks,
Jesse



