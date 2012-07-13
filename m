Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Spa4M-0005Gv-Ts
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 09:13:43 +0200
Received: by pbbrq2 with SMTP id rq2so4690465pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 00:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=lwwaUvJsJPxL2r5M+EHfHSOxy7l2REOWkVMdWhGumlI=;
	b=Ru/tuKDU3FkwhzRnTNWqNksYYuzfuHm3FFDn3XgfQtpNKvaDPoyikxP9BsDKzecuHj
	oT8aC/LUiVGTgxzcxPpjfFHCP1/8MCzYlcuUNhSD8xqufZgcQxOvxdy/jx636W+tU9Zp
	zxrkbR8cFfxx9F3YVg0OIfnUG1r19H4AVwSh5nGYul25QDzUrUedYIac5/QfwNF2arHD
	BhURxvAqctgO3yD9xLn6L/0pQCwoKNy5DAXSXO1D24kuGGffa1LluvHOhNFHVbwI4tou
	SDhhK5/FfU4RQdHxjdUrOfkie6CwcWoHfkv2q43QdZAEuyNXz91XnspCU4IB25gC+R3N
	RNoA==
Received: by 10.68.221.106 with SMTP id qd10mr1132422pbc.42.1342162947921;
	Fri, 13 Jul 2012 00:02:27 -0700 (PDT)
Received: from [192.168.1.101] ([94.205.108.162])
	by mx.google.com with ESMTPS id tq4sm5449677pbc.11.2012.07.13.00.02.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 00:02:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CAMKF1sp-u9FraoAbD9qkLoxWF-N6_0-_6yQOjWfpgVQ=HGivFA@mail.gmail.com>
Date: Fri, 13 Jul 2012 11:02:21 +0400
Message-Id: <174BA203-E567-4073-A23F-6FAC0E7FE0EE@gmail.com>
References: <1342156064-52888-1-git-send-email-elvis.dowson@gmail.com>
	<CAMKF1sp-u9FraoAbD9qkLoxWF-N6_0-_6yQOjWfpgVQ=HGivFA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1278)
Cc: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [poky] meta: Fix SRC_URI warnings to use "protocol" not "proto"
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
X-List-Received-Date: Fri, 13 Jul 2012 07:13:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi Khem,

On Jul 13, 2012, at 10:51 AM, Khem Raj wrote:

> Saul already posted a patch for OE-Core there was discussion on that
> thread as well

Ok! I just noticed it after deleting everything and doing a fresh rebuild!

Elvis


