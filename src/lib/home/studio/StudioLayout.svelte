<script>
	import ProfileIcon from './ProfileIcon.svelte';
	import { page } from '$app/stores';
	import {
		BellDot,
		Home,
		Image,
		ImagePlus,
		LogOut,
		Menu,
		Settings,
		SparkleIcon,
		User,
		UserCheck,
		Users
	} from 'lucide-svelte';
	import Button from '$lib/components/ui/button/button.svelte';
	import Input from '$lib/components/ui/input/input.svelte';
	import HomeIcon from '$lib/images/icons/home.png';
	import { emailStatus } from '$lib/state';
	import ToggleMode from '../comps/ToggleMode.svelte';

	let isMobileMenu = false;
	let layoutNavs = [
		{
			name: 'Home',
			link: '/',
			icon: Home
		},
		{
			name: 'Photographers',
			link: '/profiles',
			icon: Users
		},
		{
			name: 'Photos',
			link: '/photos',
			icon: Image
		},
	
		{
			name: 'Profile',
			link: '/profile',
			icon: UserCheck
		},
		{
			name: 'create',
			link: '/create',
			icon: ImagePlus
		},
		{
			name: 'Notify',
			link: '/dashboard',
			icon: BellDot
		}
	];
	// let teams = [
	// 	{
	// 		name: 'Frontend Team',
	// 		link: '#',
	// 		icon: 'F'
	// 	},
	// 	{
	// 		name: 'UI Designers',
	// 		link: '#',
	// 		icon: 'U'
	// 	},
	// 	{
	// 		name: 'System Designers',
	// 		link: '#',
	// 		icon: 'S'
	// 	}
	// ];
	let webdata = {
		img: HomeIcon,
		profileName: 'Saloni Maheshwari',
		email: 'Tom Cook',
		profileImg: 'https://i.pinimg.com/564x/88/db/6f/88db6fd38202de80d7c7c3964783cb04.jpg',
		profileLink: '#',
		topic: 'Dashboard',
		webname: 'Shutterspot'
	};
	let input = '';
	$: routeID = $page.route.id?.split('/') || '/';

	export let email = '';
</script>

<div>
	<div
		class="{isMobileMenu
			? 'opacity-100 transition-opacity ease-linear duration-300'
			: 'opacity-0 transition-opacity ease-linear duration-300'} relative z-50 lg:hidden"
		role="dialog"
		aria-modal="true"
	>
		<div
			class="{isMobileMenu
				? 'translate-x-0 transition ease-out duration-300 transform '
				: '-translate-x-full transition ease-out duration-300 transform'} fixed inset-0 bg-gray-900/80"
		/>

		<div
			class="{isMobileMenu
				? 'translate-x-0 transition ease-out duration-300 transform '
				: '-translate-x-full transition ease-out duration-300 transform'} fixed inset-0 flex"
		>
			<div
				class="{isMobileMenu
					? 'opacity-100 ease-in-out duration-300'
					: 'opacity-0 ease-in-out duration-300'}  relative mr-16 flex w-full max-w-xs flex-1"
			>
				<div class="absolute left-full top-0 flex w-16 justify-center pt-5">
					<button type="button" class="-m-2.5 p-2.5" on:click={() => (isMobileMenu = false)}>
						<span class="sr-only">Close sidebar</span>
						<svg
							class="h-6 w-6 text-white"
							fill="none"
							viewBox="0 0 24 24"
							stroke-width="1.5"
							stroke="currentColor"
							aria-hidden="true"
						>
							<path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
						</svg>
					</button>
				</div>

				<!-- Sidebar component, swap this element with another sidebar if you like -->
				<div
					class="flex grow flex-col gap-y-5 overflow-y-auto bg-gray-900 px-6 pb-4 ring-1 ring-white/10"
				>
					<div class="flex h-16 shrink-0 items-center gap-2 border-b border-gray-400">
						<img class="h-8 w-auto" src={webdata.img} alt="Your Company" />
						<a href="/" class="text-white font-bold text-xl">{webdata.webname}</a>
					</div>
					<nav class="flex flex-1 flex-col">
						<ul role="list" class="flex flex-1 flex-col gap-y-7">
							<li>
								<ul role="list" class="-mx-2 space-y-1">
									{#each layoutNavs as item}
										<li>
											<!-- Current: "bg-gray-800 text-white", Default: "text-gray-400 hover:text-white hover:bg-gray-800" -->
											<a
												on:click={() => (isMobileMenu = false)}
												href={item.link}
												class="{routeID === item.link
													? 'bg-gray-800 text-white'
													: 'text-gray-400 hover:text-white capitalize hover:bg-gray-800'} group flex gap-x-3 rounded-md p-2 text-sm leading-6 font-semibold"
											>
												<svelte:component this={item.icon} strokeWidth="1.3" />
												{item.name}
											</a>
										</li>
									{/each}
								</ul>
							</li>
							<!-- <li>
								<div class="text-xs font-semibold leading-6 text-gray-400">Your teams</div>
								<ul role="list" class="-mx-2 mt-2 space-y-1">
									{#each teams as item}
										<li>
											<a
												href={item.link}
												class="{routeID === item.link
													? 'bg-gray-800 text-white'
													: 'text-gray-400 hover:text-white hover:bg-gray-800'} group flex gap-x-3 rounded-md p-2 text-sm leading-6 font-semibold"
											>
												<span
													class="flex h-6 w-6 shrink-0 items-center justify-center rounded-lg border border-gray-700 bg-gray-800 text-[0.625rem] font-medium text-gray-400 group-hover:text-white"
													>{item.icon}</span
												>
												<span class="truncate">{item.name}</span>
											</a>
										</li>
									{/each}
								</ul>
							</li> -->
							<li class="mt-auto">
								<a
									href="/"
									class="group -mx-2 flex gap-x-3 rounded-md p-2 text-sm font-semibold leading-6 text-gray-400 hover:bg-gray-800 hover:text-white"
								>
									<svg
										class="group-hover:rotate-45 transition-all duration-150 h-6 w-6 shrink-0"
										fill="none"
										viewBox="0 0 24 24"
										stroke-width="1.5"
										stroke="currentColor"
										aria-hidden="true"
									>
										<path
											stroke-linecap="round"
											stroke-linejoin="round"
											d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.324.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 011.37.49l1.296 2.247a1.125 1.125 0 01-.26 1.431l-1.003.827c-.293.24-.438.613-.431.992a6.759 6.759 0 010 .255c-.007.378.138.75.43.99l1.005.828c.424.35.534.954.26 1.43l-1.298 2.247a1.125 1.125 0 01-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.57 6.57 0 01-.22.128c-.331.183-.581.495-.644.869l-.213 1.28c-.09.543-.56.941-1.11.941h-2.594c-.55 0-1.02-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 01-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 01-1.369-.49l-1.297-2.247a1.125 1.125 0 01.26-1.431l1.004-.827c.292-.24.437-.613.43-.992a6.932 6.932 0 010-.255c.007-.378-.138-.75-.43-.99l-1.004-.828a1.125 1.125 0 01-.26-1.43l1.297-2.247a1.125 1.125 0 011.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.087.22-.128.332-.183.582-.495.644-.869l.214-1.281z"
										/>
										<path
											stroke-linecap="round"
											stroke-linejoin="round"
											d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
										/>
									</svg>
									Settings
								</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>

	<!-- Static sidebar for desktop -->
	<div
		class="hidden lg:fixed lg:inset-y-0 lg:z-50 lg:flex lg:w-52 xl:w-60 lg:flex-col border-r border-primary/30"
	>
		<!-- Sidebar component, swap this element with another sidebar if you like -->
		<div class="flex grow flex-col gap-y-5 overflow-y-auto bg-gray-50 dark:bg-gray-900 px-6 pb-4">
			<div class="flex h-16 shrink-0 items-center gap-2">
				<img class="h-8 w-auto" src={webdata.img} alt="Your Company" />
				<a href="/" class="text-primary font-bold text-xl">{webdata.webname}</a>
			</div>
			<nav class="flex flex-1 flex-col">
				<ul role="list" class="flex flex-1 flex-col gap-y-7">
					<li>
						<ul role="list" class="-mx-2 space-y-1">
							{#each layoutNavs as item}
								<!-- {#if item.name === 'create'}
									<li>
										<a
											href={item.link}
											class="{routeID === item.link
												? 'bg-gray-800 text-white transition-all duration-150'
												: 'text-sky-400 group shadow-md shadow-sky-800/40  hover:bg-sky-800/20  bg-sky-800/40 border border-sky-400   transition-all duration-150'} group flex gap-x-3 rounded-md p-2 text-sm leading-6 font-semibold capitalize"
										>
											<svelte:component
												this={item.icon}
												strokeWidth="1.34"
												size="22"
												class="group-hover:rotate-[25deg] transition-all duration-500 "
											/>
											{item.name}
										</a>
									</li>
								{:else} -->
								<li>
									<!-- Current: "bg-gray-800 text-white", Default: "text-gray-400 hover:text-white hover:bg-gray-800" -->
									<a
										href={item.link}
										class="{routeID === item.link
											? 'bg-gray-800 text-white transition-all duration-150'
											: 'dark:text-gray-400 dark:hover:text-white hover:bg-gray-300/50 dark:hover:bg-sky-800/30 transition-all duration-150'} group flex gap-x-3 rounded-md p-2 text-sm leading-6 font-semibold capitalize"
									>
										<svelte:component this={item.icon} strokeWidth="1.34" size="22" />
										{item.name}
									</a>
								</li>
								<!-- {/if} -->
							{/each}
						</ul>
					</li>
					<!-- <li>
						<div class="text-xs font-semibold leading-6 text-gray-400">Your teams</div>
						<ul role="list" class="-mx-2 mt-2 space-y-1">
							{#each teams as item}
								<li>
									<a
										href={item.link}
										class="{routeID === item.link
											? 'bg-gray-800 text-white transition-all duration-100'
											: 'text-gray-400 hover:text-white hover:bg-gray-800 transition-all duration-100'}  group flex gap-x-3 rounded-md p-2 text-sm leading-6 font-semibold"
									>
										<span
											class="flex h-6 w-6 shrink-0 items-center justify-center rounded-lg border border-gray-700 bg-gray-800 text-[0.625rem] font-medium text-gray-400 group-hover:text-white"
											>{item.icon}</span
										>
										<span class="truncate">{item.name}</span>
									</a>
								</li>
							{/each}
						</ul>
					</li> -->
					<li class="mt-auto">
						<a
							href="/"
							class="group -mx-2 flex gap-x-3 rounded-md p-2 text-sm font-semibold leading-6 dark:text-gray-400 hover:bg-gray-300/50 dark:hover:bg-sky-800/30 dark:hover:text-white"
						>
							<svg
								class="group-hover:rotate-45 transition-all duration-150 h-6 w-6 shrink-0"
								fill="none"
								viewBox="0 0 24 24"
								stroke-width="1.5"
								stroke="currentColor"
								aria-hidden="true"
							>
								<path
									stroke-linecap="round"
									stroke-linejoin="round"
									d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.324.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 011.37.49l1.296 2.247a1.125 1.125 0 01-.26 1.431l-1.003.827c-.293.24-.438.613-.431.992a6.759 6.759 0 010 .255c-.007.378.138.75.43.99l1.005.828c.424.35.534.954.26 1.43l-1.298 2.247a1.125 1.125 0 01-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.57 6.57 0 01-.22.128c-.331.183-.581.495-.644.869l-.213 1.28c-.09.543-.56.941-1.11.941h-2.594c-.55 0-1.02-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 01-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 01-1.369-.49l-1.297-2.247a1.125 1.125 0 01.26-1.431l1.004-.827c.292-.24.437-.613.43-.992a6.932 6.932 0 010-.255c.007-.378-.138-.75-.43-.99l-1.004-.828a1.125 1.125 0 01-.26-1.43l1.297-2.247a1.125 1.125 0 011.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.087.22-.128.332-.183.582-.495.644-.869l.214-1.281z"
								/>
								<path
									stroke-linecap="round"
									stroke-linejoin="round"
									d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
								/>
							</svg>
							Settings
						</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>

	<div class="lg:pl-52 xl:pl-60">
		<div
			class="{routeID[2] === 'profile' || routeID[2] === 'edit'
				? 'md:hidden'
				: ''} sticky top-0 z-40 flex h-16 shrink-0 items-center gap-x-4 border-b border-gray-200 bg-white dark:bg-gray-950/20 dark:backdrop-blur-sm shadow-sm sm:gap-x-6"
		>
			<button
				type="button"
				class="ml-2 p-2.5 text-primary/80 lg:hidden"
				on:click={() => (isMobileMenu = true)}
			>
				<span class="sr-only">Open sidebar</span>
				<Menu />
			</button>

			<!-- Separator -->
			<div class="h-6 w-px bg-gray-900/10 lg:hidden" aria-hidden="true" />

			<div class=" flex justify-end w-full gap-x-4 self-stretch lg:gap-x-6">
				<div
					class="flex items-center px-4 gap-x-4 lg:gap-x-3 dark:bg-gradient-to-r from-transparent to-gray-900/90"
				>
					<!-- <button type="button" class="-m-2.5 p-2.5 text-gray-400 hover:text-gray-800">
						<span class="sr-only">View notifications</span>
						<BellDot strokeWidth="1.5" />
					</button> -->
					<ToggleMode />
					<!-- Separator -->
					<div class="hidden lg:block lg:h-6 lg:w-px lg:bg-gray-900/10" aria-hidden="true" />

					<!-- Profile dropdown -->
					{#if email === ''}
						<Button href="/login" size="sm"
							><User strokeWidth="1.3" size="16" class="mr-1" /> Login</Button
						>
					{:else}
						<ProfileIcon />
						<!-- content here -->
					{/if}
				</div>
			</div>
		</div>

		<main class="py-4 md:py-10 bg-white dark:bg-slate-950">
			<div class="px-4 sm:px-6 lg:px-4 xl:px-8">
				<slot />
			</div>
		</main>
	</div>
</div>
