Return-Path: <stephanoc@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id AA1D0608B7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 16:36:08 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so237357067pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 09:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qKc7p+M3C+oaamlj3Z6SoTL3zAdfj0TcRFxfHndL0C4=;
	b=BCF3inp8p4zLMIvZU7DuWNu2pcyICIMZpLUB1fxIxGg8kt8nMB1+FbLVGy/q59wfC6
	l8wyd2cbCjfxlDdngQaRk9FrzuxXRKxgHwnbYx2y1gFZakBeeQVXhSuYyD2UaWU/8pPf
	ty5zX8LYNK5PDxGSd/tOOx7tDdVf6yZORoCxAHqeWjVi72OEOMtUKtZbDFHGcd33dMdx
	XFrgggL4COfkppHFMEXQLPN2NmoISTACMZriIjYIkmlgWMvFCIziYOkuNM6MxxZX9hs5
	80Asg0vNXAuf7IgD2id2/dRYJlJ9SI23c4QshLvq0RsPEeiCk2C81G8M3s2SxZFleoQL
	/MOw==
X-Received: by 10.68.165.194 with SMTP id za2mr29077236pbb.72.1445963767864;
	Tue, 27 Oct 2015 09:36:07 -0700 (PDT)
Received: from mail.spox.systems
	(ec2-52-11-37-43.us-west-2.compute.amazonaws.com. [52.11.37.43])
	by smtp.gmail.com with ESMTPSA id
	im9sm40579488pbc.1.2015.10.27.09.36.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Oct 2015 09:36:07 -0700 (PDT)
Date: Tue, 27 Oct 2015 16:35:43 +0000
From: Stephano Cetola <stephanoc@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151027163542.GA21537@mail.spox.systems>
References: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: OE/Yocto developer survey
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
X-List-Received-Date: Tue, 27 Oct 2015 16:36:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 10/26, Cliff Brake wrote:
> How long have you been using OE?  

~3 years

> How do you use OE/Yocto?
 [ X ] product development
 [ X ] hobby/research/education/yocto core developer, etc
 
> What distro do you use?
 [   ] Poky
 [   ] Angstrom
 [ X ] nodistro or custom (Based on Poky)
 
> How do you organize multiple git repos?
 [   ] Git submodules
 [ X ] Repo
 [ X ] Other (Customer Python scripts)
 
> What packaging system?
 [   ] OPKG
 [   ] RPM
 [ X ] Other (IPK)
 
> What GUI toolkits?
 [ X ] Qt
 [ X ] Gtk
 [   ] EFL
 [ X ] HTML5/JS
 [   ] Other
 
 Our clients develop in QML.

> What init system?
 [   ] systemd
 [ X ] sysvinit
 [ X ] busybox init
 [   ] Other
 
> What libc?
 [ X ] glibc
 [   ] uclibc
 [   ] musl
 [   ] Other
 
> How do you develop custom applications?
 [   ] application-SDK
 [ X ] devshell
 [ X ] develop on PC, test on target
 [   ] Other
 
> What language do you primarily use for custom applications?
 [ X ] C
 [ X ] C++
 [   ] Python
 [   ] Javascript
 [   ] Lua
 [   ] Other
 
 Qt for C++

> What do you use for Continuous Integration?
 [   ] Buildbot
 [ X ] Jenkins
 [   ] Other

Tried buildbot but it required too much customization for our small
team.

> Do you use any any of the tooling projects
> (https://www.yoctoproject.org/tools-resources/projects) such as ADT,
> Hob, Toaster, etc?
 
 No

