Return-Path: <stephan.binner@basyskom.com>
Received: from mx1.basyskom.com (groupware.basyskom.com [144.76.148.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7A9B36017E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Mar 2015 07:27:38 +0000 (UTC)
X-Footer: YmFzeXNrb20uY29t
Received: from fridolin.localnet ([193.158.222.114])
	(authenticated user sbin@basyskom.com)
	by mx1.basyskom.com (Kerio Connect 8.4.1)
	(using TLSv1.1 with cipher DHE-RSA-AES256-SHA (256 bits))
	for openembedded-devel@lists.openembedded.org;
	Fri, 6 Mar 2015 08:27:38 +0100
From: Stephan Binner <stephan.binner@basyskom.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 06 Mar 2015 08:27:35 +0100
Message-ID: <2899618.yEhnJzyaiQ@fridolin>
Organization: basysKom GmbH
User-Agent: KMail/4.8.5 (Linux/3.2.0-77-generic; KDE/4.8.5; x86_64; ; )
In-Reply-To: <20150305140403.GR2337@jama>
References: <20150303182827.GC2337@jama> <3137890.DjIWZ5FYZB@fridolin>
	<20150305140403.GR2337@jama>
MIME-Version: 1.0
Subject: Re: [meta-qt5][PATCHv2] fix build of qtwebengine if qtbase has no accessibility
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
X-List-Received-Date: Fri, 06 Mar 2015 07:27:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

On Thursday 05 March 2015 15:04:03 Martin Jansa wrote:

> I've sent additional patch to fix building with accessibility enabled.

You mean "without accessibility" :-)... (damn double negation #ifdef)

> Please get it merged in upstream, because your patch seems to be broken

It's merged in 5.4 branch: https://codereview.qt-project.org/#/c/107873/

Regards,
Stephan


