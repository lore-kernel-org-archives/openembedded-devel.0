Return-Path: <stephan.binner@basyskom.com>
Received: from mx1.basyskom.com (groupware.basyskom.com [144.76.148.65])
	by mail.openembedded.org (Postfix) with ESMTP id 40EFD72667
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 15:14:19 +0000 (UTC)
X-Footer: YmFzeXNrb20uY29t
Received: from fridolin.localnet ([193.158.222.114])
	(authenticated user sbin@basyskom.com)
	by mx1.basyskom.com (Kerio Connect 8.4.0)
	(using TLSv1.1 with cipher DHE-RSA-AES256-SHA (256 bits))
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Feb 2015 16:14:20 +0100
From: Stephan Binner <stephan.binner@basyskom.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Feb 2015 16:14:19 +0100
Message-ID: <1924700.0Y3Fg92bfb@fridolin>
Organization: basysKom GmbH
User-Agent: KMail/4.8.5 (Linux/3.2.0-76-generic; KDE/4.8.5; x86_64; ; )
In-Reply-To: <20150227144201.GN2309@jama>
References: <4018372.oWEBFrtGCE@fridolin> <20150227144201.GN2309@jama>
MIME-Version: 1.0
Subject: Re: [meta-qt5][PATCH] recipes: upgrade from 5.4.0 to 5.4.1
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
X-List-Received-Date: Fri, 27 Feb 2015 15:14:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

On Friday 27 February 2015 15:42:01 Martin Jansa wrote:

> I've fixed these issues in separate commit in meta-qt5/master-next and

Thanks.

> - please confirm that you agree with SOB line.

Sure I do. :-)

Today I noticed that qtwebengine doesn't compile if qtbase is not built with
"accessibility" (which I usually have defined via some qtbase*.bbappend).

The situation was the same with 5.4.0 - not sure if it's worth the effort
to patch qtwebengine to be able to compile without accessibility though.

Regards,
Stephan


